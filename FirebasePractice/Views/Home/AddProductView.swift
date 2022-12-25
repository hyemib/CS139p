//
//  AddProductView.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/26.
//

import SwiftUI

struct AddProductView: View {
    @StateObject var productStore: ProductStore
    @Binding var showingSheet: Bool
    
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @State private var artist: String = ""
    @State private var album: String = ""
    
    var body: some View {
        Button(action: {
            imagePickerPresented.toggle()
        }) {
            profileImage?
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("이미지 추가")
        }
        .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: { ImagePicker(image: $selectedImage) })
        
        TextField("artist", text: $artist, axis: .vertical)
            .padding()
        TextField("album", text: $album, axis: .vertical)
            .padding()
        
        Button(action: {
            let createdAt = Date().timeIntervalSince1970
            let product = Product(id: UUID().uuidString, artist: artist, album: album, image: "", createdAt: createdAt)
            productStore.addProduct(product)
            showingSheet.toggle()
        }) {
            Text("product 추가")
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    
    }
}

struct AddProductView_Previews: PreviewProvider {
    @State static var showingSheet = false
    
    static var previews: some View {
        AddProductView(productStore: ProductStore(), showingSheet: $showingSheet)
    }
}
