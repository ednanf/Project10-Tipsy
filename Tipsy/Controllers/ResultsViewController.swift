//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Modified by Ednan R. Frizzera Filho on 07/09/2023
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var perPerson: String?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = perPerson
        
        settingsLabel.text = "Split between \(numberOfPeople ?? "ERROR") people, with \(tipPercentage ?? "ERROR") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
