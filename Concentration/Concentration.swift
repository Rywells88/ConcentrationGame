//
//  Concentration.swift
//  Concentration
//
//  Created by Ryley Wells on 2018-10-26.
//  Copyright © 2018 Ryley Wells. All rights reserved.
//

import Foundation

class concentration
{
    var time: Date
    var score = 0
    var viewedCards = [Int]()
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                    
                    let currdate = Date()
                    score += Int(10/Float((currdate.compare(time)).rawValue))
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else{
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            if viewedCards.contains(index){
                score -= 1
            }
            viewedCards.append(index)
        }
    }
   
init(numberOfPairsOfCards : Int) {
    time = Date()
    for _ in  0..<numberOfPairsOfCards{
        let card = Card()
        cards += [card, card]
    }
    for _ in 0..<10
    {
        cards.sort { (_,_) in arc4random() < arc4random() }
}
    
}
    
}
