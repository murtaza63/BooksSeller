//
//  BooksDetail.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 02/06/2022.
//

import SwiftUI

struct BooksDetail: View {
    @State var booksDetails = [Book]()
    var body: some View {
       
        NavigationView{
            
            List(booksDetails, id:\.self){book in
                NavigationLink(destination: BuyLinks()){
                HStack(alignment: .lastTextBaseline) {
                    VStack(alignment: .leading){
                        
                    Text(book.title)
                        .font(.headline)
                    Text("by " + book.author)
                        .font(.caption)
                    Text(book.description)
                     
                    }.padding(.bottom, 50)
                    Group{
                        Image(systemName: "Person.fill").resizable()
                        .data(url: URL(string: book.bookImage)!)
                    }.frame(width: 100, height: 200)
                }.frame(width: 350, height: 300)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                   
                }
            }
            
            .task {
            await loadData()
            
            }
        }
        .ignoresSafeArea(.all)
     
               
    
}
    func loadData()async {
         guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=CgKtenC5a62LH7yhpdUCGj32mNHbjNKm") else {
             print("Invalid Url")
             return
         }

         do {
             let (data, _) = try await URLSession.shared.data(from: url)

             if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data){
                 booksDetails = decodeResponse.results.lists[0].books

                 print(booksDetails)

             }


         }catch {
             print("Invalid data")
         }

     }
    
}
struct BooksDetail_Previews: PreviewProvider {
    static var previews: some View {
        BooksDetail()
    }
}


extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
