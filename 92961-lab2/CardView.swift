//
//  CardView.swift
//  92961-lab2
//
//  Created by student on 27/04/2024.
//

import Foundation
import SwiftUI


struct CardView: View{
    var content: String
    var width = CGFloat(100)
    var height = CGFloat(200)
    
    @Binding var colorTheme: ColorTheme
    @State var isReversed = false
    
    
    var body: some View{
        let rectangle = RoundedRectangle(
            cornerRadius: 12)
       
        
        ZStack {
                    Group {
                        rectangle.fill(colorTheme.primary)

                        rectangle
                            .strokeBorder(style: StrokeStyle(lineWidth: 2))
                            .foregroundColor(colorTheme.background)

                        
                        Text(content).font(.largeTitle)
                        
                    }
                    rectangle
                        .fill(colorTheme.background)

                        .opacity(isReversed ? 1 : 0)
                    
        }.onTapGesture() {
            isReversed = !isReversed
        }
    }
}
