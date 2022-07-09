//
//  BooksDetail.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 02/06/2022.
//

import SwiftUI

struct BooksDetail: View {
  @ObservedObject var api = Api()
  
    var body: some View {
       
        NavigationView{
            
            List(api.myBooks, id:\.self){book in
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
                        AsyncImage(url:URL(string: book.bookImage)){ image in
                            image.resizable()
                        }placeholder: {
                            ProgressView()
                        }
                            
//                        Image(systemName: "Person.fill").resizable()
//                        .data(url: URL(string: book.bookImage)!)
                    }.padding(.top, 50)//.frame(width: 100, height: 200)
                }.frame(width: 350, height: 300)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                   
                }
            }
            
            .task {
                await api.loadData()
            
            }
        }
        .ignoresSafeArea(.all)
     
               
    
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
