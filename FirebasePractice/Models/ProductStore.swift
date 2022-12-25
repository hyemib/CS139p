//
//  ProductStore.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/25.
//

import Foundation
import FirebaseFirestore

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    let database = Firestore.firestore()
    
    init() {
        products = []
    }
    
    var sampleProdcut: Product {
        Product(id: "", artist: "LANY", album: "Malibu Nights", image: "", createdAt: 2018)
    }
    
    func fetchProducts() {
        database.collection("Products")
            .getDocuments { (snapshot, error) in
                self.products.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        let artist: String = docData["artist"] as? String ?? ""
                        let album: String = docData["album"] as? String ?? ""
                        let image: String = docData["image"] as? String ?? ""
                        //let releasedAt: String = docData["releasedAt"] as? String ?? ""
                        let createdAt: Double = docData["createdAt"] as? Double ?? 0
                        
                        let product: Product = Product(id: id, artist: artist, album: album, image: image, createdAt: createdAt)
                        
                        self.products.append(product)
                    }
                }
            }
    }
    
    func addProduct(_ product: Product) {
        database.collection("Products")
            .document(product.id)
            .setData(["artist": product.artist,
                      "album": product.album,
                      "image": product.image,
                      //"releasedAt": product.releasedAt,
                      "createdAt": product.createdAt])
        fetchProducts()
    }
    
    func updateProduct(_ product: Product) {
        database.collection("Products")
            .document(product.id)
            .setData(["artist": product.artist,
                      "album": product.album,
                      "image": product.image,
                      //"releasedAt": product.releasedAt,
                      "createdAt": product.createdAt])
        fetchProducts()
    }
    
    func removeProduct(_ product: Product) {
        database.collection("Products")
            .document(product.id).delete()
        fetchProducts()
    }
}
