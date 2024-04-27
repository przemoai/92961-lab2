//
//  ContentView.swift
//  92961-lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
  
    
    var body: some View {
        
        
        var styles = [""]
        let emojis = ["🫠","🙃","😊","💄"]
        
        
        
        HStack {
            
            ForEach(emojis, id: \.self) {emoji in
                    
                drawCard(content: emoji)
                }
            
        }
           
            
                
            
            
        }
        
    }


#Preview {
    ContentView()
}
