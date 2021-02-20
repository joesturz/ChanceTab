//
//  ViewContoller.swift
//  TapChance
//
//  Created by Joe Sturzenegger on 2/20/21.
//  Copyright © 2021 Joe Sturzenegger. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var dieButton0: UIButton? = UIButton()
  @IBOutlet var dieButton1: UIButton? = UIButton()
  @IBOutlet var dieButton2: UIButton? = UIButton()
  @IBOutlet var dieButton3: UIButton? = UIButton()
  @IBOutlet var dieButton4: UIButton? = UIButton()

  
  @IBOutlet var randomNumber: UILabel? = UILabel()
  @IBOutlet var rollButton: UIButton? = UIButton()
  @IBOutlet weak var dicePicker: UIPickerView!
  
  var activeArray = [false, false, false, false, false]
  var sidesArray = ["2", "4", "6", "8", "10", "12", "20"]
  var diceCountArray = ["1" ,"2" ,"3" ,"4" ,"5"]
  
  var sides = 2
  var diceCount = 1
  var colorChangeCounter = 0;
  
  var orangeColor = UIColor(red: 253.0/255.0, green: 151.0/255.0, blue: 31.0/255.0, alpha: 1.0)
  var whiteColor = UIColor.white
  
  override func viewDidLoad() {
    super.viewDidLoad()
    randomNumber?.text = "TapChance"
    dicePicker.delegate = self
    dicePicker.dataSource = self
    setAllDiceToActive()
  }
  
  @IBAction func clickRoll(_ sender: UIButton) {
    var array = ["-","-","-","-","-"]
    var total = 0
    var headCount = 0
    var tailCount = 0
    
    for i in 0..<diceCount {
      if activeArray[i] {
        let randNum = Int(arc4random()) % sides + 1
        
        if sides == 2 {
          if randNum == 1 {
            array[i] = "H"
            headCount += 1
          } else {
            array[i] = "T"
            tailCount += 1
          }
          
          total = total + randNum
        } else {
          
          array[i] = "\(randNum)"
          total = total + randNum
        }
      } else {
        if sides == 2 {
          if sender.currentTitle == "H" {
            array[i] = "H"
            headCount += 1
          } else {
            array[i] = "T"
            tailCount += 1
          }
        } else {
          guard let title = sender.currentTitle else {
            return
          }
          array[i] = title
          let numString = title as NSString
          let dieValue = numString.integerValue
          total = total + dieValue
        }
      }
    }
    
    dieButton0?.setTitle(array[0], for: .normal)
    dieButton1?.setTitle(array[1], for: .normal)
    dieButton2?.setTitle(array[2], for: .normal)
    dieButton3?.setTitle(array[3], for: .normal)
    dieButton4?.setTitle(array[4], for: .normal)
    
    if sides == 2 {
      if headCount == tailCount {
        randomNumber?.text = "Draw"
      } else {
        randomNumber?.text = headCount > tailCount ? "Heads" : "Tails"
      }
    } else {
      randomNumber?.text = "\(total)"
    }
    colorChangeCounter += 1
    randomNumber?.textColor = colorChangeCounter % 2 == 0 ? orangeColor : whiteColor
  }
  
  @IBAction func die0Tapped(_ sender: UIButton) {
    dieTapped(sender, number: 0)
  }
  
  @IBAction func die1Tapped(_ sender: UIButton) {
    dieTapped(sender, number: 1)
  }
  
  @IBAction func die2Tapped(_ sender: UIButton) {
    dieTapped(sender, number: 2)
  }
  
  @IBAction func die3Tapped(_ sender: UIButton) {
    dieTapped(sender, number: 3)
  }
  
  @IBAction func die4Tapped(_ sender: UIButton) {
    dieTapped(sender, number: 4)
  }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
    case 0:
      return 7
    default:
      return 5
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch component {
    case 0:
      return sidesArray[row]
    default:
      return diceCountArray[row]
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch component {
    case 0:
      if row < 6 {
        sides = (row + 1) * 2
      } else {
        sides = 20
      }
    default:
      diceCount = row + 1
    }
  }
}

//MARK: Die Methods
extension ViewController {
  func setAllDiceToActive() {
    setDieColor(for: dieButton0)
    setDieColor(for: dieButton1)
    setDieColor(for: dieButton2)
    setDieColor(for: dieButton3)
    setDieColor(for: dieButton4)
    for i in 0..<activeArray.count {
      activeArray[i] = true
    }
  }
  
  func setDieColor(for button: UIButton?) {
    guard let button = button else {
      return 
    }
    button.setTitleColor(whiteColor, for: .normal)
  }
  
  func dieTapped(_ button: UIButton, number: Int) {
    let color = activeArray[number] ? orangeColor : whiteColor
    button.setTitleColor(color, for: .normal)
    activeArray[number] = !activeArray[number]
  }
}
