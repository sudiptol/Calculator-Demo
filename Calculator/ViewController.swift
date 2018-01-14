//
//  ViewController.swift
//  Calculator
//
//  Created by Sudipto Lahiry on 12/11/17.
//  Copyright © 2017 Sudipto Lahiry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTyping = false
    
    @IBAction func userSelectedNumber(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        if userInTheMiddleOfTyping {
            
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            
        } else {
            display.text = digit
            userInTheMiddleOfTyping = true
        }
        
        
        
    }
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            return display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userInTheMiddleOfTyping = false
        }
        
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
            
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

