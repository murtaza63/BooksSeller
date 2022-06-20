//
//  CircularProgress.swift
//  BooksSeller
//
//  Created by Ghulam Murtaza on 13/06/2022.
//

import SwiftUI

struct CircularProgress: View {
    let progress: Double
    var body: some View {
      
            
            ZStack{
        Circle()
            .stroke(
                Color.pink.opacity(0.5),
                lineWidth: 30
            )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.pink,
                        style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)
            
        }.frame(width: 200, height: 200)
    
    }
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgress(progress: 0)
    }
}
