//
//  DetailView.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/25.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var productStore: ProductStore
    @State private var showingUpdateSheet: Bool = false
    @Binding var product: Product
    
    var body: some View {
        VStack {
            Image("common")
                .resizable()
                .frame(width: 150, height: 150)
            Text(product.artist)
                .foregroundColor(.gray)
            Text(product.album)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button {
                        showingUpdateSheet.toggle()
                        print(product)
                    } label: {
                        Text("Update")
                    }
                    .sheet(isPresented: $showingUpdateSheet) {
                        UpdateProductView(showingSheet: $showingUpdateSheet, product: $product)
                    }
                    

                    Button {
                        productStore.removeProduct(product)
                    } label: {
                        Text("Remove")
                    }
                }
                
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(product: ProductStore().sampleProdcut)
//    }
//}
