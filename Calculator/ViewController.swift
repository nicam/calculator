//
//  ViewController.swift
//  Calculator
//
//  Created by Pascal Helfenstein on 15/05/16.
//  Copyright © 2016 Pascal Helfenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var display: UILabel!
    
    private var userIsTyping = false
    
    private var model = Model()

    @IBAction func buttonTouch(sender: UIButton) {
        let digit = sender.currentTitle!; // Unwrap type optional
        if (userIsTyping) {
            let currentText = display.text!;
            display.text = currentText + digit;
        } else {
            display.text = digit;
        }
        userIsTyping = true;
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!;
        }
        set {
            display.text = String(newValue);
        }
    }
    
    @IBAction func performOperation(sender: UIButton) {
        if userIsTyping {
            model.setOperand(displayValue)
            userIsTyping = false;
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            model.performOperation(mathematicalSymbol)
        }
        displayValue = model.result
    }


}

