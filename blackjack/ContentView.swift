//
//  ContentView.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject var game = GameManager()
  
  var body: some View {
    
    VStack {
      Text(game.status)
        .font(.largeTitle)
        .padding()
      
      Spacer()
      
      PlayerView(player: game.dealer)
        .padding(.bottom, 100)
      PlayerView(player: game.player)
        .padding(.top, 100)
      
      Spacer()
      HStack {
        Button("Hit") {
          game.hitPlayer()
        }
        .padding()
        .disabled(game.status != "Hit or Stand?")
        
        Button("Stand") {
          game.stand()
        }
        .padding()
        .disabled(game.status != "Hit or Stand?")
      }
      .padding()
      
      Button("Start") {
        game.startNewGame()
      }
      .padding()
    }
  }
}

#Preview {
    ContentView()
}
