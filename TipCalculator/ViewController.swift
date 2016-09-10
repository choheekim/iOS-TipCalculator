//
//  ViewController.swift
//  TipCalculator
//
//  Created by Chohee Kim on 9/10/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    
    let tipPercentages = [0, 0.15, 0.2, 0.25]
    var bill: Double!
    var controlIndex: Int!
    var numOfPeople : Int!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        peopleStepper.minimumValue = 1
        peopleStepper.wraps = true
        peopleStepper.autorepeat = true
        
        resetButton.layer.borderWidth = 1;
        resetButton.layer.borderColor = UIColor.whiteColor().CGColor;
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetValues() {
        billField.text = String(0)
        numOfPeopleLabel.text = String(1)
        tipControl.selectedSegmentIndex = 0
        tipLabel.text = String(format : "$%.2f", 0.0)
        totalLabel.text = String(format : "$%.2f", 0.0)
        
        
    }
    
    @IBAction func resetToOriginalState(sender: AnyObject) {
        // the line should read
        resetValues()
        
    }
    

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }

    @IBAction func calculateTip(sender: AnyObject) {
        

        
        //possible tip percentage
        let tipPercentages = [0, 0.15, 0.2, 0.25]
        
        let bill = Double(billField.text! ) ?? 0
        let controlIndex = tipControl.selectedSegmentIndex
        let tip = bill * tipPercentages[controlIndex]
        let numOfPeople = Int(peopleStepper.value)
        let total = Double(bill + tip)/(Double(numOfPeople))
        
    
        numOfPeopleLabel.text = "\(String(numOfPeople))"
        tipLabel.text = String(format : "$%.2f", tip)
        totalLabel.text = String(format : "$%.2f", total)
        
        
    }
    

}

