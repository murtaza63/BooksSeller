//
//  ListView.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 23/05/2022.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var api = Api()
   
    @State var progress = 0.0
    @State var total: Double = 100
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        func sortList(){
            api.lists.sort()
        }
       
        
        var body: some View {
           
            VStack{
               
                ZStack{
                  
                    if api.lists == [nil] {
                    ProgressView("Loading...", value: progress, total: total )
                    .onReceive(timer){ _ in
                        if progress < 100{
                            progress += 2
                        }
                    }
            } else{
            NavigationView {
              
                List(api.lists, id: \.listId){item in
                    
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
                        await api.loadData()
                        sortList()
                       
                            
                        }
                   
                        
                }
                    .navigationTitle("Books List")
                    .ignoresSafeArea(.all)
                    
            }
            }
            }
        }

       
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
