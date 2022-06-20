//
//  ContentView.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 07/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.0
    var total = 100.0

    let timer  = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
   
    var body: some View {
        ZStack{
            if progress < total {
          
            
                ProgressView("Loading...", value: progress,total: total).onReceive(timer){ _ in
                    if progress < 100 {
                        progress += 2
                    }
                }
                .progressViewStyle(.circular)
         
           
        }else{
            
        ListView()
        }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
