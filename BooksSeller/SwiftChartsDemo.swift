//
//  SwiftChartsDemo.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 25/06/2022.
//

import SwiftUI
import Charts

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
   
}

struct SwiftChartsDemo: View {
    let items: [Item] = [
    Item(type: "Engineering", value: 100),
    Item(type: "Designs", value: 70),
    Item(type: "Operations", value: 72),
    Item(type: "Sales", value: 22),
    Item(type: "Mgmt", value: 130)
  
    ]
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                //bar, line, area, ruler, point
                Chart(items) { item in
                    BarMark(x: .value("Department", item.type), y: .value("Profit", item.value))
                        .foregroundStyle(Color.red.gradient)
                    
                }.frame(height: 200)
                    .padding()
                
            }.navigationTitle("Charts")
        }
    }
}

struct SwiftChartsDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwiftChartsDemo()
    }
}
