//
//  Deck.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

class Deck {
  private var cards: [Card] = []
  
  init() {
    self.reset()
  }
  
  
  /* this is cool, the ? is optional, and the ! is an unwrap (like rust) */
  func draw() -> Card? {
    return cards.popLast()
  }
  
  func reset() {
    /* this predictive autocomplete is going to kill me ! (it's so good) */
    cards.removeAll()
    
    for suit in Suit.allCases {
      for rank in Rank.allCases {
        cards.append(Card(suit: suit, rank: rank, visible: true))
      }
    }
    
    /* optional, maybe add a shuffle function so we can have a true deck option */
    cards.shuffle()
  }
}
