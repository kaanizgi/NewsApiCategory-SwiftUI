//
//  WebService.swift
//  NewsApiCategory-SwiftUI
//
//  Created by Kaan İzgi on 3.04.2022.
//

import Foundation


class WebService {
    
    func getNews(url:URL) async throws -> NewsModel {
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let newsData = try? JSONDecoder().decode(NewsModel.self, from: data)
        return newsData!
    }
}
