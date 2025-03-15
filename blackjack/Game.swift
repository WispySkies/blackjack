//
//  Game.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//

import Foundation

class GameManager: ObservableObject {
  @Published var player: Player
  @Published var dealer: Player
  @Published var deck: Deck
  @Published var status: String
  
  init() {
    self.player = Player()
    self.dealer = Player()
    self.deck = Deck()
    self.status = "Welcome to Blackjack!"
  }
  
  func startNewGame() {
    /* no need on first call, it's all empty but.. */
    deck.reset()
    player.resetHand()
    dealer.resetHand()
    initialDeal()
  }
  
  func initialDeal() {
    /* could use the hits here. */
    player.giveCard(card: deck.draw()!, faceup: true)
    dealer.giveCard(card: deck.draw()!, faceup: false)
    player.giveCard(card: deck.draw()!, faceup: true)
    dealer.giveCard(card: deck.draw()!, faceup: true)
    
    if player.score == 21 {
      status = "Blackjack! Player Wins!"
      return
    }
    status = "Hit or Stand?"
  }
  
  func hitPlayer() {
    player.giveCard(card: deck.draw()!, faceup: true)
    
    /* recalculate our score, a prior hit on an
       ace over 21 would already have been reduced. */
    player.recalculateScore()
    
    /* only reduce aces until we can't bust */
    var aceCount = player.hand.filter { $0.rank == .ace }.count
    while player.score > 21 && aceCount > 0 {
      player.score -= 10
      aceCount -= 1
    }

    /* bust */
    if player.score > 21 {
      determineWinner()
    }
  }
  
  func hitDealer() {
    dealer.giveCard(card: deck.draw()!, faceup: true)
  }
  
  func stand() {
    status = "Player Stands"
    startDealer()
  }
  
  func startDealer() {
    /* show hidden */
    dealer.hand[0].visible = true
    /* stands on 17+ */
    while dealer.score < 17 {
      hitDealer()
    }
    determineWinner()
  }
  
  func determineWinner() {
    if player.score > 21 {
      status = "Player Busts! Dealer Wins!"
    } else if dealer.score > 21 {
      status = "Dealer Busts! Player Wins!"
    } else if player.score > dealer.score {
      status = "Player Wins!"
    } else {
      status = "Dealer Wins!"
    }
  }
}
