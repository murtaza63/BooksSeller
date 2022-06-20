//
//  ListView.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 23/05/2022.
//

import SwiftUI

struct ListView: View {
    @State  var lists = [Lists]()
    @State var progress = 0.0
    @State var total: Double = 100
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        func sortList(){
            lists.sort()
        }
       
        
        var body: some View {
            VStack{
                ZStack{
            if lists == [nil] {
                    ProgressView("Loading...", value: progress, total: total )
                    .onReceive(timer){ _ in
                        if progress < 100{
                            progress += 2
                        }
                    }
            } else{
            NavigationView {
              
                List(lists, id: \.listId){item in
                    
                    VStack (alignment: .leading){
                        NavigationLink(destination: BooksDetail()){
                            Text(item.listName)
                            .frame(width: 350, height: 50)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                            
                        }
                      
                    }
                } .listStyle(.grouped)
              
                    .task {
                        await loadData()
                        sortList()
                       
                            
                        }
                   
                        
                }
                    .navigationTitle("Books List")
                    .ignoresSafeArea(.all)
                    
            }
            }
            }
        }

       func loadData()async {
            guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=CgKtenC5a62LH7yhpdUCGj32mNHbjNKm") else {
                print("Invalid Url")
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)

                if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data){
                   lists = decodeResponse.results.lists

                    print(decodeResponse.results.lists)

                }


            }catch {
                print("Invalid data")
            }

        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
