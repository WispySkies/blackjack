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
    status = "Hit or Stand?"
  }
  
  func hitPlayer() {
    player.giveCard(card: deck.draw()!, faceup: true)
    /* quick bust */
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
