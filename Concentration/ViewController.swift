//
//  ViewController.swift
//  Concentration
//
//  Created by Ryley Wells on 2018-10-26.
//  Copyright © 2018 Ryley Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    lazy var game = concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCountNum += 1
        if (flipCountNum == 1){
            if( isTimerRunning == false){
            runTimer()
            }
        }
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            if (game.score < -2)        // once your score hits -2, your time will increase by 2 for every mismatch you make
            {
                seconds += 2
                updateTimer()
            }
        }else{
            print("choosen card was not in card buttons.")
        }
    }
    
    @IBOutlet weak var score: UILabel!
    

    
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func resetButton(_ sender: UIButton) {
        flipCountNum = 0
        for _ in cardButtons.indices {
            game = concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
            updateTheme()
            updateViewFromModel()
            resetTimer()
    }
    }
    
    var isTimerRunning = false   // made to prevent the timer from creating new timer objects
    
    @IBOutlet weak var timerLabel: UILabel!
        var seconds = 0;
        var timer = Timer()
    
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector (ViewController.updateTimer)), userInfo: nil, repeats: true)  // time interval is how often the method will be called, selector is the method being called
        // func update timer will be called every second to update the label
        isTimerRunning = true
    }
    @objc func updateTimer(){
        seconds+=1
        timerLabel.text = "Time : \(seconds)/45"                                    //player has 45 seconds to match all the cards
        if (seconds >= 45){
            timerLabel.text = "Out of time, push reset"
            game = concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
        }
    }
    func resetTimer (){
        seconds = -1
        updateTimer()
    }
    
    @IBOutlet weak var flipCount: UILabel!
   
    var flipCountNum = 0 {
        didSet{
            flipCount.text = "Flips : \(flipCountNum)"
    }
}                                                               
    let Theme = gameTheme()
    lazy var emojiChoices = Theme.theme()
  func updateTheme()
    {
        emojiChoices  = Theme.theme()
    if (Theme.themeNumber == 5)// christmas
    {
        for index in cardButtons.indices{
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        score.backgroundColor = #colorLiteral(red: 0.6094989181, green: 0.09267569333, blue: 0.109466143, alpha: 1)
        score.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        flipCount.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        flipCount.backgroundColor = #colorLiteral(red: 0.6094989181, green: 0.09267569333, blue: 0.109466143, alpha: 1)
        resetButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        resetButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        themeLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        themeLabel.text = "Theme: Christmas!"
    }
    if (Theme.themeNumber == 4)
    {
        for index in cardButtons.indices{
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        score.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        score.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        flipCount.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        flipCount.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        resetButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        resetButton.setTitleColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), for: .normal)
        themeLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        themeLabel.text = "Theme: Valentines day!"
    }
    if (Theme.themeNumber == 3)
    {
        for index in cardButtons.indices{
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        }
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        score.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        score.textColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
        flipCount.textColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
        flipCount.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resetButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resetButton.setTitleColor(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1), for: .normal)
        themeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        themeLabel.text = "Theme: Jobs!"
    }
    if(Theme.themeNumber == 2)
    {
        for index in cardButtons.indices{
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        score.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        score.textColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
        flipCount.textColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
        flipCount.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resetButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resetButton.setTitleColor(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1), for: .normal)
        themeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        themeLabel.text = "Theme: Animals!"
        }
        if (Theme.themeNumber == 1)
        {
            for index in cardButtons.indices{
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            score.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            score.textColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
            flipCount.textColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
            flipCount.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            resetButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            resetButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            themeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            themeLabel.text = "Theme: Faces!"
        }
        if (Theme.themeNumber == 0)
        {
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            score.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            score.textColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            flipCount.textColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            flipCount.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            resetButton.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            resetButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            themeLabel.textColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            themeLabel.text = "Theme: Halloween!"
        }
    }

    var matched = [Int]()
    func updateViewFromModel() {
        score.text = "Score = \(game.score)"
    for index in cardButtons.indices {
        let button = cardButtons[index]
        let card = game.cards[index]
        if card.isFaceUp {
            button.setTitle(emoji(for: card), for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else if (card.isMatched == false){
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = themeLabel.textColor
        }else if (card.isMatched == true ){
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.setTitle("", for: UIControl.State.normal)
            }
        }
    }

    var emoji = [Int:String]()
    
    func emoji(for card:Card)-> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }



}
