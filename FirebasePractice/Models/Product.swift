//
//  Product.swift
//  FirebasePractice
//
//  Created by hyemi on 2022/12/25.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    var id: String
    var artist: String
    var album: String
    var image: String
    //var releasedAt: String
    var createdAt: Double
    
    var createdDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}
