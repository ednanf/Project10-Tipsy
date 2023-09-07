//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 2
    var billTotal = 0.0
    var splitValue = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Clear previous selection
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Select only the tapped button
        sender.isSelected = true
        
        // Get the tip amount, drop "%" and convert to double (since the value will be < 1)
        let tipAmount = Double(((sender.titleLabel?.text)?.dropLast())!)
        
        // Convert tip amount to decimal - safe to force unwrap since there will always be a value
        // Store in a global variable
        tip = tipAmount! / 100
        
        // Dismiss the keyboard when tapping the tip amount
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // Increase and decrease the number according to the stepper
        // Stepers don't need any additional setup to increment/decrement values
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        // Convert the stepper to int -- initially it's a double
        // Store in a global variable
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? ""
        
        // Check performed to prevent crashes
        if bill != "" {
            
            // Convert the bill to a Double and store in the global variable
            billTotal = Double(bill)!
            
            let total = billTotal * (1 + tip) / Double(numberOfPeople)
            
            let formattedTotal = String(format: "%.2f", total)
            
            // Store the final, formatted value in a global variable
            splitValue = formattedTotal
            
        }
    }
}

