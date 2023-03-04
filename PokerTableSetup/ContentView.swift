//
//  ContentView.swift
//  PokerTableSetup
//
//  Created by m1 on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    let n = 6;
    let colors: [Color] = [.green, .cyan, .orange   , .indigo, .blue, .red, .pink,.yellow]
    var delta: Double {
        1.0 / Double(n)
    }
    
    var body: some View {
        VStack {
            Text("Player's Table").font(.largeTitle).fontWeight(.bold).padding()
            Spacer()
            ZStack {
                Capsule().fill(.indigo.opacity(0.5))
                
                // Table
                ForEach(0..<n, id: \.self) { i in
                    let start: Double = delta * Double(i) // 1/6 * i
                    let end: Double = start + delta // start + 1/6
                    let color = colors[i % colors.count] // if n is more than colors count
                    
                    Capsule().trim(from: start, to: end).stroke(color, lineWidth: 15)
                        .blur(radius: 15)
                }
                
                // Players
                ForEach(0..<n, id: \.self) { i in
                    let start: Double = delta * Double(i) // 1/6 * i
                    let end: Double = start + 0.01 // size of player
                    let color = colors[i % colors.count] // if n is more than colors count
                    
                    Capsule().trim(from: start, to: end)
                        .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        .stroke(color, style: StrokeStyle(lineWidth: 15 , lineCap: .round))
                    
                }
            }
            .frame(width: 230, height: 360)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
