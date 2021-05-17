//
//  ViewController.swift
//  Calculator-UIKit
//
//  Created by 徐满心 on 2021/5/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func tapAC(_ sender: UIButton) {
        currentString.text = ""
        isEntering = false
    }
    
    @IBAction func tapSign(_ sender: UIButton) {
        tapSign(withSign: sender.currentTitle!, on: sender)
    }
    
    @IBAction func tapDelete(_ sender: UIButton) {
        if currentString.text!.count>0 {
            currentString.text!.remove(at: currentString.text!.index(before: currentString.text!.endIndex))
        }
    }
    
    @IBAction func tapCompute(_ sender: UIButton) {
        if let string = currentString.text {
            if let num = string.calculate() {
                currentString.text = string+" = \(num)"
            } else {
                currentString.text = "ERROR"
            }
            isEntering=false
        }
    }
    
    func tapSign(withSign sign:String,on button:UIButton) {
        if let string = currentString.text {
            if isEntering {
                currentString.text = string + sign
            } else {
                currentString.text = sign
                isEntering = true
            }
        }
    }
    
    var isEntering = false
    
    @IBOutlet weak var currentString: UILabel!
}

