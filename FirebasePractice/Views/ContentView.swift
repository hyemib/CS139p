//
//  ContentView.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(ProductStore())
                .tabItem {
                    Image(systemName: "music.note.house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            LikeView()
                .tabItem {
                    Image(systemName: "heart")
                }
            
            
            MyPageView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
