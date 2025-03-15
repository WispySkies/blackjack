//
//  CardView.swift
//  blackjack
//
//  Created by Declan McCue on 3/14/25.
//
import SwiftUI

struct CardView: View {
  let Card: Card
  
  var body: some View {
    Text(Card.toString)
    .font(.title)
    .foregroundColor(.white)
    .padding()
    .background(Color.black)
    .cornerRadius(10)
    .shadow(radius: 5)
    .frame(width: 100, height: 40)
  }
}

/* this is so awesome */
#Preview {
  CardView(Card: Card(suit: .spades, rank: .ten, visible: true))
  CardView(Card: Card(suit: .spades, rank: .ten, visible: false))
  CardView(Card: Card(suit: .hearts, rank: .two, visible: true))
}
