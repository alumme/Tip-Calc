//
//  ViewController.swift
//  Tip Calculator
//
//  Created by John Gadbois on 9/30/15.
//  Copyright (c) 2015 John Gadbois. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var twentyFiveButton: UIButton!
    @IBOutlet weak var splitTipLabel: UILabel!
    @IBOutlet weak var splitTotalLabel: UILabel!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    var percent: Double = 0.00
    var tip: Double = 0.00

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gold_bg")!)
        unselectButtons()

    }
    
    func calculateUsingPercentage(percentage: Double) -> Double
    {
        tip = (NSString(string: billAmountTextField.text!)).doubleValue * percentage
        return tip
    }

    
    @IBAction func calculateButtonTap(sender: UIButton)
    {
        tip = calculateUsingPercentage(percent)
        tipLabel.text = "$" + (NSString(format: "%.2f", tip) as String)
    }
    
    
    func unselectButtons()
    {
        tenButton.backgroundColor = UIColor(patternImage: UIImage(named: "10_unselected_image")!)
        fifteenButton.backgroundColor = UIColor(patternImage: UIImage(named: "15_unselected_image")!)
        twentyButton.backgroundColor = UIColor(patternImage: UIImage(named: "20_unselected_image")!)
        twentyFiveButton.backgroundColor = UIColor(patternImage: UIImage(named: "25_unselected_image")!)
    }

    
    @IBAction func tenButtonTap(sender: UIButton)
    {
        percent = 0.10
        unselectButtons()
        tenButton.backgroundColor = UIColor(patternImage: UIImage(named: "10_selected_image")!)
        
    }
    
    
    @IBAction func fifteenButtonTap(sender: UIButton)
    {
        percent = 0.15
        unselectButtons()
        fifteenButton.backgroundColor = UIColor(patternImage: UIImage(named: "15_selected_image")!)
    }
    
    
    @IBAction func twentyButtonTap(sender: UIButton)
    {
        percent = 0.20
        unselectButtons()
        twentyButton.backgroundColor = UIColor(patternImage: UIImage(named: "20_selected_image")!)
    }
    
    
    @IBAction func twentyFiveButtonTap(sender: UIButton)
    {
        percent = 0.25
        unselectButtons()
        twentyFiveButton.backgroundColor = UIColor(patternImage: UIImage(named: "25_selected_image")!)
    }
    
    @IBAction func splitButtonTap(sender: UIButton)
    {
        var split = tip / (NSString(string: numberOfPeopleTextField.text!)).doubleValue
        splitTipLabel.text = "The tip is $" + (NSString(format: "%.2f", split) as String) + " per person"
        var total = split + (NSString(string: billAmountTextField.text!)).doubleValue / (NSString(string: numberOfPeopleTextField.text!)).doubleValue
        splitTotalLabel.text = "The total per person is $" + (NSString(format: "%.2f", total) as String)
    }
    
    
}

