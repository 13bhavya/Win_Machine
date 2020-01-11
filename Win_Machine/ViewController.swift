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

