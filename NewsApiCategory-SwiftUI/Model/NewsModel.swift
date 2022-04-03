//
//  NewsModel.swift
//  NewsApiCategory-SwiftUI
//
//  Created by Kaan İzgi on 3.04.2022.
//

import Foundation

struct NewsModel : Codable {
    var articles:[News]
}

struct News: Codable,Identifiable {
    let id = UUID()
    var author: String?
    var title: String?
    var urlToImage: String?
    var url:String?
    var publishedAt:String?
    var content: String?
    var description:String?
    var source:source
}

struct source:Codable{
    var id:String?
    var name:String?
}


enum Categorys:String,CaseIterable {
        case Business
        case Entertainment
        case Health
        case Science
        case Sports
        case Technology
        
        var title: String{
            switch self{
            case.Business:return"business"
            case.Entertainment:return"entertainment"
            case.Health:return"Health"
            case.Science:return"Science"
            case.Sports:return"Sports"
            case.Technology:return "Technology"
            }
        }
    }
