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
  
  func giveCard(_ card: Card) {
    hand.append(card)
    score += card.rank.value
  }
  
  func resetHand() {
    hand.removeAll()
    score = 0
  }
}
