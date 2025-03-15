//
//  Card.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

import Foundation

enum Suit: String, CaseIterable {
  case hearts = "♥"
  case diamonds = "♦"
  case clubs = "♣"
  case spades = "♠"
}

enum Rank: String, CaseIterable {
  case two = "2", three = "3", four = "4", five = "5", six = "6",
       seven = "7", eight = "8", nine = "9", ten = "10",
       jack = "J", queen = "Q", king = "K", ace = "A"
  
  /* this is a computed property, it provides custom behavior */
  var value: Int {
    switch self {
    case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
      return Int(self.rawValue)!
    case .jack, .queen, .king:
      return 10
    case .ace:
      return 11
    }
  }
}

/* for semantic purposes, structs are copied on reference, whereas a class is not (it is referred) */
struct Card: Identifiable {
  /* = is an initialization, when using :, the value is not initialized */
  let id = UUID()
  let suit: Suit
  let rank: Rank
  let visible: Bool
  
  var toString: String {
    if visible {
      return "\(rank.rawValue)\(suit.rawValue)"
    } else {
      return "?"
    }
  }
}
