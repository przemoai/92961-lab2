//
//  ContentView.swift
//  92961-lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI




struct ContentView: View {
    @State var cardsCount = 4
    var styles = [""]
    let emojis = ["🐵", "🐸", "🐶", "🐱", "🦊", "🐨", "🐭", "🐹", "🐰", "🐻", ]
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
            Button(
                action: { cardsCount += offset },
                label: { Image(systemName: symbol).font(.largeTitle) }
            ).disabled(cardsCount + offset < 2
                       || cardsCount + offset >= emojis.count)
        }
    
    func cardDisplay() -> some View {

        
        let columns = [GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120))]
      
        return LazyVGrid(columns: columns ){
            ForEach(0 ..< cardsCount, id: \.self) { i in
                CardView(content: emojis[i])
            }
        }
    }
    
    
    var body: some View {
           VStack {
               HStack {
                   cardDisplay()
               }.padding()
               HStack {
                   adjustCardNumber(by: -2, symbol: "minus.square")
                   Spacer()
                   adjustCardNumber(by: 2, symbol: "plus.square")
               }.padding()
           }.padding()
        
           
        
            
                
            
            
        }
        
    }


#Preview {
    ContentView()
}
