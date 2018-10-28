//
//  gameTheme.swift
//  Concentration
//
//  Created by Ryley Wells on 2018-10-28.
//  Copyright © 2018 Ryley Wells. All rights reserved.
//

import Foundation
class gameTheme {
    
    let differentThemes = [["👻","🎃","🕸","🧙‍♂️","👺","🤡","👽","💀","🤖","🧛‍♀️","🧟‍♂️","👀"],// Halloween
        ["😂","😭","🧐","😒","🤗","🤩","😩","😔","😆","🙃","😋","😜"],// faces
        ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁"],// animals
        ["👩‍🚒","👩‍✈️","👩‍🚀","👩‍⚖️","👩🏻‍🔧","👨‍🔧","👩‍🔬","👨‍🔬","👩‍🏫","👨‍🏫","👩‍🍳","👩‍🌾"],// jobs
        ["❤️","😍","😘","😻","💑","🌹","🌷","🌸","🍫","🎁","🎀","❣️"],// Valentines day
        ["🎁","🤶","🎅","❄️","☃️","⛄️","✈️","🎉","📬","🙆🏿‍♀️","👨‍👨‍👧‍👦","🧦"]]// Winter
    
    var themeNumber = 2
    func theme ()-> [String]{
        let temp = themeNumber
            while (temp == themeNumber){
                self.themeNumber = Int(arc4random_uniform(UInt32(differentThemes.count)))
            }
            return differentThemes[themeNumber]
        }
    }

