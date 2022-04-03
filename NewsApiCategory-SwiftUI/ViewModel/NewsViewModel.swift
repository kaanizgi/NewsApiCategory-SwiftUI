//
//  NewsViewModel.swift
//  NewsApiCategory-SwiftUI
//
//  Created by Kaan İzgi on 3.04.2022.
//

import Foundation

class NewsViewModel:ObservableObject {
    
    let webservice = WebService()
    
    @Published var NewsList = [News]()
    @Published var selectedCategory: Categorys = Categorys.Business {
        didSet {
            Task.init {
                await downloadNews(tag: selectedCategory)
            }
        }
    }
    
    func downloadNews(tag:Categorys) async {
        do {
            let news = try await webservice.getNews(url: URL(string: "https://newsapi.org/v2/top-headlines?country=tr&category=\(tag)&apiKey=9a2315dccd3442aeb939f24d42e28f39")!)
            DispatchQueue.main.async {
                self.NewsList = news.articles
                print(news)
            }
        } catch {
            print(error)
        }
    }
}
