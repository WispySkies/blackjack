//
//  PlayerView.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

import SwiftUI

struct PlayerView: View {
  
  let cards: [Card]
  
  var body: some View {
    HStack {
      ForEach(cards) { card in
        CardView(Card: card)
      }
    }
  }
}

#Preview {
  PlayerView(cards: [
    Card(suit: .spades, rank: .ace, visible: true),
    Card(suit: .hearts, rank: .king, visible: true),
    Card(suit: .diamonds, rank: .seven, visible: true)
  ])
}
