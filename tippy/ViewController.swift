//
//  ViewController.swift
//  tippy
//
//  Created by hor kimleng on 12/26/18.
//  Copyright © 2018 hor kimleng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var percentageSegmentControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    //Variables
    var result: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberTextField.becomeFirstResponder()
        numberTextField.placeholder = "$"
        numberTextField.addTarget(self, action: #selector(calculatePecentage), for: .editingChanged)
        percentageSegmentControl.addTarget(self, action: #selector(calculatePecentage), for: .valueChanged)
    }
    
    @objc fileprivate func calculatePecentage() {
        
        guard let input = Double(numberTextField.text!) else {
            resultLabel.text = ""
            return
        }
        
        switch percentageSegmentControl.selectedSegmentIndex {
        case 0:
            result = (input  * 0.18) + input
        case 1:
            result = (input  * 0.20) + input
        default:
            result = (input  * 0.25) + input
        }
        
        resultLabel.text = String(format:"%.2f", result ?? "")
    }
}

