//
//  Player.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

import Foundation

/* kind of like the observer design pattern !
 an observable object means whatever is drawing us gets redrawn */
class Player: ObservableObject {
  @Published var hand: [Card] = []
  @Published var score: Int = 0
  
  func giveCard(card: Card, faceup: Bool = true) {
    /* copy because card is a let ??? */
    hand.append(Card(suit: card.suit, rank: card.rank, visible: faceup))
    score += card.rank.value
  }
  
  func resetHand() {
    hand.removeAll()
    score = 0
  }
}
