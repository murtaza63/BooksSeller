//
//  MainView.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 21/06/2022.
//

import SwiftUI

struct MainView: View {
   @ObservedObject var api = Api()
  

    var body: some View {
        List(api.myBooks, id:\.self){book in
            Text(book.title)
        }.task {
            await api.loadData()
        }
//        Grid{
//            GridRow{
//                ZStack{
//                    Color.blue
//                    Text("Welcom in the House of Readers").foregroundColor(.white)
//                        .font(.title2)
//
//                }.gridCellColumns(3)
//
//
//            }
//            Text("Popular Books").font(.custom("Amercia", size: 20)).fontWeight(.bold)
//                .padding(.trailing, 250)
//                .foregroundColor(.blue)
//                .background(Color.yellow)
//                .fontWeight(.bold)
//                .frame(width: 500)
//
//
//            GridRow{
//                ZStack{
//                    Rect()
//                    List(api.myBooks, id:\.self){book in
//                        Image(book.bookImage)
//                    }
//
//                }
//                ZStack{
//                    Rect()
//                    Image(systemName: "car.fill").font(.largeTitle)
//                }
//                ZStack{
//                    Rect()
//                    Image(systemName: "book.fill").font(.largeTitle)
//                }
//
//            }
//            GridRow{
//                ZStack{
//                    Rect()
//                    Image(systemName: "bus.fill").font(.largeTitle)
//                }
//                ZStack{
//                    Rect()
//                    Image(systemName: "airplane").font(.largeTitle)
//                }
//                ZStack{
//                    Rect()
//                    Image(systemName: "airtag").font(.largeTitle)
//                }
//
//
//            }
//        }.ignoresSafeArea(.all)
    }
}

struct Rect: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
          
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
