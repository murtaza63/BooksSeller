//
//  ProgressView.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 14/06/2022.
//

import SwiftUI
struct NewProgressView: View {
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                CircularProgress(progress: progress)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
                
            }.frame(width: 200, height: 200)
            Spacer()
            HStack {
                Slider(value: $progress, in: 0...1)
                Button("Reset"){
                    resetProgress()
                    
                   
                }.buttonStyle(.borderedProminent)
            }
        }
    }
    func resetProgress(){
        progress = 0
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        NewProgressView()
    }
}
