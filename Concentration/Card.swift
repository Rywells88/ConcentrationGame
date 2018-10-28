//
//  File.swift
//  Concentration
//
//  Created by Ryley Wells on 2018-10-26.
//  Copyright © 2018 Ryley Wells. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }

    init()
    {
        self.identifier  = Card.getUniqueIdentifier()
    }
}
