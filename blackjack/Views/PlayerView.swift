//
//  PlayerView.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

import SwiftUI

struct PlayerView: View {
  
  @ObservedObject var player: Player
  
  var body: some View {
    HStack {
      ForEach(player.hand) { card in
        CardView(Card: card)
          .frame(width: 60, height: 90)
      }
    }
  }
}

#Preview {
  var player = Player()
  PlayerView(player: player)
}
