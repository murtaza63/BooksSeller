//
//  Model.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 23/05/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
//  Model.swift
//  FetchData
//
//  Created by Ghulam Murtaza on 05/06/2022.
//

import Foundation

struct Response: Codable{
    let results: Results
}


struct Results: Codable{
    let lists: [Lists]
    enum CodingKeys: String, CodingKey {
        case lists
    }
}
struct Lists: Codable, Comparable, Hashable{
    let listId: Int
    let listName: String
    let books: [Book]
    
    enum CodingKeys: String, CodingKey{
        case listId = "list_id"
        case listName = "list_name"
        case books
    }
    
    static func <(lhs: Lists, rhs: Lists ) -> Bool {
        return lhs.listName < rhs.listName
    }
}

struct Book: Codable, Hashable{
    
    let author: String
    let title: String
    let description: String
    let bookImage: String
    let buyLinks : [BYLinks]
    enum CodingKeys:String, CodingKey{
        case author = "author"
        case title = "title"
        case  description = "description"
        case bookImage = "book_image"
        case buyLinks = "buy_links"
    }
}
struct BYLinks: Codable, Hashable {
    let name: String
    let url: String
}
