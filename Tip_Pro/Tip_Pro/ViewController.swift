//
//  ViewController.swift
//  Tip_Pro
//
//  Created by Jiayue Li on 12/23/16.
//  Copyright © 2016 Jiayue Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var peopleAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    @IBOutlet weak var splitAmountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            splitAmountField.text = ""
            return
        }
        
        var peopleAmount = 1
        
        if (peopleAmountField.text != "") {
            peopleAmount = Int(peopleAmountField.text!)!
        }
        else {
            peopleAmountField.text = String(peopleAmount)
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.125
        case 1:
            tipPercentage = 0.15
        case 2:
            tipPercentage = 0.18
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        let splitAmount = round(100*totalAmount/Double(peopleAmount))/100
        
        if (!billAmountField.isEditing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        if (!peopleAmountField.isEditing) {
            peopleAmountField.text = String(format: "%.2f", peopleAmount)
        }
        peopleAmountField.text = String(peopleAmount)
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
        splitAmountField.text = String(format: "%.2f", splitAmount)
    }

}

