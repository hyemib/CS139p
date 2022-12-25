//
//  HomeView.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var productStore: ProductStore
    @State private var showingAddSheet: Bool = false
    @State private var showingUpdateSheet: Bool = false
    @State private var showingDetailView: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach($productStore.products) { $product in
                        NavigationLink(destination: {
                            DetailView(product: $product)
                        }) {
                            VStack {
                                Image("common")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                Text(product.artist)
                                    .foregroundColor(.gray)
                                Text(product.album)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Main")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddProductView(productStore: productStore, showingSheet: $showingAddSheet)
            }
            .onAppear {
                productStore.fetchProducts()
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ProductStore())
    }
}
