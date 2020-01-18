//
//  ViewController.swift
//  Win_Machine
//
//  Created by Bhavya on 2020-01-08.
//  Copyright © 2020 Bhavya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var playerMoney = 1000;
    var winnings = 0;
    var jackpot = 5000;
    var turn = 0;
    var playerBet = 0;
    var winNumber = 0;
    var lossNumber = 0;
    var spinResult: Bool ;
    var fruits = "";
    var winRatio = 0;
    var grapes = 0;
    var bananas = 0;
    var oranges = 0;
    var cherries = 0;
    var bars = 0;
    var bells = 0;
    var sevens = 0;
    var blanks = 0;
    
    required init?(coder aDecoder: NSCoder) {
        self.spinResult = true
        super.init(coder: aDecoder)
    }
    
    /* Utility function to show Player Stats */
    func showPlayerStats()
    {
//        winRatio = winNumber / turn;
//        ("#jackpot").text("Jackpot: " + jackpot);
//        $("#playerMoney").text("Player Money: " + playerMoney);
//        $("#playerTurn").text("Turn: " + turn);
//        $("#playerWins").text("Wins: " + winNumber);
//        $("#playerLosses").text("Losses: " + lossNumber);
//        $("#playerWinRatio").text("Win Ratio: " + (winRatio * 100).toFixed(2) + "%");
    }
    
    /* Check to see if the player won the jackpot */
    func checkJackPot() {
        /* compare two random values */
        var jackPotTry = Math.floor(Math.random() * 51 + 1);
        var jackPotWin = Math.floor(Math.random() * 51 + 1);
        if (jackPotTry == jackPotWin) {
            alert("You Won the $" + jackpot + " Jackpot!!");
            playerMoney += jackpot;
            jackpot = 1000;
        }
    }

/* Utility function to check if a value falls within a range of bounds */
    func checkRange(value: Int, lowerBounds: Int, upperBounds: Int) -> Int {
        if (value >= lowerBounds && value <= upperBounds)
        {
            return value;
        }
        else {
            return value;
        }
    }
    
    /* Utility function to show a win message and increase player money */
    func showWinMessage() {
        playerMoney += winnings;
        $("div#winOrLose>p").text("You Won: $" + winnings);
        resetFruitTally();
        checkJackPot();
    }

    /* Utility function to show a loss message and reduce player money */
    function showLossMessage() {
        playerMoney -= playerBet;
        $("div#winOrLose>p").text("You Lost!");
        resetFruitTally();
    }
    
    /* When this function is called it determines the betLine results.
    e.g. Bar - Orange - Banana */
    func Reels(betLine: String) {
        var betLine = [" ", " ", " "];
        var outCome = [0, 0, 0];

        for spin in 0..<3 {
            outCome[spin] = Int.random(in: 0..<65) ;
            //outCome[spin] = Math.floor((Math.random() * 65) + 1);
            switch (outCome[spin]) {
            case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                    betLine[spin] = "blank";
                    blanks += 1 ;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                    betLine[spin] = "Grapes";
                    grapes += 1;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                    betLine[spin] = "Banana";
                    bananas += 1;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                    betLine[spin] = "Orange";
                    oranges += 1;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                    betLine[spin] = "Cherry";
                    cherries += 1;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                    betLine[spin] = "Bar";
                    bars += 1;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                    betLine[spin] = "Bell";
                    bells += 1;
                    break;
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                    betLine[spin] = "Seven";
                    sevens += 1;
                    break;
            default: break;
            }
        }
    }

    /* This function calculates the player's winnings, if any */
    func determineWinnings()
    {
        if (blanks == 0)
        {
            if (grapes == 3) {
                winnings = playerBet * 10;
            }
            else if(bananas == 3) {
                winnings = playerBet * 20;
            }
            else if (oranges == 3) {
                winnings = playerBet * 30;
            }
            else if (cherries == 3) {
                winnings = playerBet * 40;
            }
            else if (bars == 3) {
                winnings = playerBet * 50;
            }
            else if (bells == 3) {
                winnings = playerBet * 75;
            }
            else if (sevens == 3) {
                winnings = playerBet * 100;
            }
            else if (grapes == 2) {
                winnings = playerBet * 2;
            }
            else if (bananas == 2) {
                winnings = playerBet * 2;
            }
            else if (oranges == 2) {
                winnings = playerBet * 3;
            }
            else if (cherries == 2) {
                winnings = playerBet * 4;
            }
            else if (bars == 2) {
                winnings = playerBet * 5;
            }
            else if (bells == 2) {
                winnings = playerBet * 10;
            }
            else if (sevens == 2) {
                winnings = playerBet * 20;
            }
            else if (sevens == 1) {
                winnings = playerBet * 5;
            }
            else {
                winnings = playerBet * 1;
            }
            winNumber += 1;
            showWinMessage();
        }
        else
        {
            lossNumber += 1;
            showLossMessage();
        }
        
    }
    
    let images = [#imageLiteral(resourceName: "Kaeli"),#imageLiteral(resourceName: "gohan"),#imageLiteral(resourceName: "godofotherplanet"),#imageLiteral(resourceName: "vegeta"),#imageLiteral(resourceName: "goku")]

    @IBOutlet weak var betView: UILabel!
    @IBOutlet weak var cashBet: UIStepper!
    
    @IBOutlet weak var imageVIew1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBAction func cashBetter(_ sender: UIStepper) {
        cashBet.maximumValue = Double(currentCash)
        let amount = Int(sender.value)
        if currentCash >= amount {
            cashBack = amount
            betView.text = "\(amount)"
        }
    }
    
    @IBAction func spinBtn(_ sender: UIButton) {
        
        imageVIew1.animationImages = [#imageLiteral(resourceName: "gohan"),#imageLiteral(resourceName: "godofotherplanet"),#imageLiteral(resourceName: "goku"),#imageLiteral(resourceName: "blackgoku"),#imageLiteral(resourceName: "Kaeli")]
        imageVIew1.animationDuration =  1
        imageVIew1.startAnimating()
        imageVIew1.animationRepeatCount = 0 // default value
        //imageVIew1.stopAnimating()

    }
    var cashBack : Int = 10{
        didSet{//update ui
            betView.text = "\(currentCash)$"
        }
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
   
    
    @IBOutlet weak var myCash: UILabel!
    var currentCash : Int{
          guard let cash = myCash.text, !(myCash.text?.isEmpty)! else {
              return 0
          }
          return Int(cash.replacingOccurrences(of: "$", with: ""))!
      }
    
    //MARK: - UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % images.count
        return UIImageView(image: images[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return images[component].size.height + 1
    }
    
    
}

extension CATransition {
    
    
}

