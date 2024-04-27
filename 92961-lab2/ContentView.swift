//
//  ContentView.swift
//  92961-lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI


struct ColorTheme: Hashable{
    var icon: String
    var label: String
    var primary: Color
    var secondary: Color
    var background: Color
}



struct ContentView: View {
    
    var colorThemes: [ColorTheme] = [
        ColorTheme(icon: "R", label:"Blue Theme", primary: Color.white, secondary:Color.white, background: Color.blue),
        ColorTheme(icon: "B", label:"Red Theme", primary: Color.white, secondary:Color.white, background: Color.red),
        ColorTheme(icon: "G", label:"Green Theme", primary: Color.white, secondary:Color.white, background: Color.green)
    ]

    var styles = [""]
    var emojis = ["🐵", "🐸", "🐶", "🐱", "🦊", "🐨", "🐭", "🐹", "🐰", "🐻", ]
    @State var cardsCount = 10
    
    @State var selectedTheme: ColorTheme
    
    
    init(){
        selectedTheme = colorThemes[0]
    }
   
    

    
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
            Button(
                action: { cardsCount += offset },
                label: { Image(systemName: symbol).font(.largeTitle) }
            ).disabled(cardsCount + offset < 2
                       || cardsCount + offset >= emojis.count)
        }
    
    func cardDisplay() -> some View {

        let minWidth=CGFloat(80)
        let columns = [
            GridItem(.adaptive(minimum:minWidth)),
        ]
      
        return LazyVGrid(columns: columns ){
            ForEach(0 ..< cardsCount, id: \.self) { i in
                CardView(content: emojis[i], colorTheme: $selectedTheme)
                    .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
            }
        }
    }
    
        
    
    func changeTheme() -> some View {
        HStack{
            ForEach(colorThemes, id: \.self) { theme in
                Button(
                    action: { selectedTheme = theme },
                    label: {Text(theme.label)}
                )
            }
            }
        }
    
    
    var body: some View {
           VStack {
               Text("Memo")
                   .font(.largeTitle)
               Spacer()
               
               HStack {
                   ScrollView{
                       cardDisplay()
                   }
                   
               }.padding()
//               HStack {
//                   adjustCardNumber(by: -2, symbol: "minus.square")
//                   Spacer()
//                   adjustCardNumber(by: 2, symbol: "plus.square")
//               }.padding()
               
               changeTheme()
           }
        
           
        
            
                
            
            
        }
        
    }


#Preview {
    ContentView()
}
