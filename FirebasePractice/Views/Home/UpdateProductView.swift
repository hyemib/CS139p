//
//  UpdateProductView.swift
//  FirebasePractice
//
//  Created by hyemi on 2023/01/09.
//

import SwiftUI

struct UpdateProductView: View {
    @EnvironmentObject var productStore: ProductStore
    @Binding var showingSheet: Bool
    
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @Binding var product: Product
    
    var body: some View {
        var _ = print(product)
        Button(action: {
            imagePickerPresented.toggle()
        }) {
            profileImage?
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("이미지 변경")
        }
        .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: { ImagePicker(image: $selectedImage) })
        
        TextField("artist", text: $product.artist, axis: .vertical)
            .padding()
        TextField("album", text: $product.album, axis: .vertical)
            .padding()
        
        Button(action: {
            let createdAt = Date().timeIntervalSince1970
            let product = Product(id: product.id, artist: product.artist, album: product.album, image: "", createdAt: createdAt)
            productStore.updateProduct(product)
            showingSheet.toggle()
        }) {
            Text("product 수정")
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    
    }
}

//struct UpdateProductView_Previews: PreviewProvider {
//    @State static var showingSheet = false
//    
//    static var previews: some View {
////        UpdateProductView(showingSheet: $showingSheet, product: pr)
//    }
//}
