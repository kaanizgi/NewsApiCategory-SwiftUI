//
//  ContentView.swift
//  NewsApiCategory-SwiftUI
//
//  Created by Kaan İzgi on 3.04.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var ViewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(Categorys.allCases, id: \.self) { search in
                            CategoryView(category: search, isSelected: ViewModel.selectedCategory == search)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        ViewModel.selectedCategory = search
                                    }
                                }
                        }
                    }.padding()
                }
                List(ViewModel.NewsList) {item in
                    NewsScreen(data: item)
                        .listRowInsets(EdgeInsets())
                }.listStyle(.plain)
                    .navigationTitle("News")
                    .navigationViewStyle(.stack)
                    .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
