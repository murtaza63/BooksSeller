//
//  BookApi.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 21/05/2022.
//

import Foundation
import SwiftUI

@MainActor
class Api: ObservableObject {
 @Published var myBooks = [Book]()
@Published var lists = [Lists]()
 @Published var buyLinks = [BYLinks]()
   
    
   
    func loadData()async {
         guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=CgKtenC5a62LH7yhpdUCGj32mNHbjNKm") else {
             print("Invalid Url")
             return
         }
         
         do {
             let (data, _) = try await URLSession.shared.data(from: url)

             if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data){
                 lists = decodeResponse.results.lists
                 myBooks = lists[0].books
                 buyLinks = myBooks[0].buyLinks
                 print("Bookst details hear", myBooks)

             }
             

         }catch {
             print("Invalid data")
         }
        
     }
}
