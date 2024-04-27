//
//  CardView.swift
//  92961-lab2
//
//  Created by student on 27/04/2024.
//

import Foundation
import SwiftUI


struct drawCard: View{
    var content: String
    var width = CGFloat(100)
    var height = CGFloat(200)
    
    
    @State var isReversed = false
    
    @State var primaryColor = Color.white
    @State var secondaryColor = Color.blue
    @State var backgroundColor = Color.blue
    @State var onBackgroundColor = Color.white
    
    
    var body: some View{
        let rectangle = RoundedRectangle(
            cornerRadius: 12)
       
        
        ZStack {
                    Group {
                        rectangle.fill(onBackgroundColor)
                            .frame(width: width, height: height)
                        
                        rectangle
                            .strokeBorder(style: StrokeStyle(lineWidth: 2))
                            .foregroundColor(backgroundColor)
                            .frame(width: width, height: height)
                            
                        Text(content).font(.largeTitle)
                        
                    }
                    rectangle
                        .fill(backgroundColor)
                        .frame(width: width, height: height)
                        .opacity(isReversed ? 1 : 0)
                    
        }.onTapGesture() {
            isReversed = !isReversed
        }
    }
}
