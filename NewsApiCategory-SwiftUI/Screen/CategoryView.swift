//
//  CategoryView.swift
//  NewsApiCategory-SwiftUI
//
//  Created by Kaan İzgi on 3.04.2022.
//

import SwiftUI

struct CategoryView: View {
    var category: Categorys
    var isSelected: Bool
    
    var body: some View {
        Text(category.rawValue)
            .fontWeight(isSelected ? .semibold : .regular)
            .foregroundColor(isSelected ? .white: .black)
            .padding(10)
            .background(.gray)
            .cornerRadius(10)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Categorys.Business, isSelected: true)
    }
}
