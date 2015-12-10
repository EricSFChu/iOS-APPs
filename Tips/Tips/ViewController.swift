//
//  ViewController.swift
//  Tips
//
//  Created by Eric Chu on 11/28/15.
//  Copyright © 2015 Eric Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelect: UISegmentedControl!
    //allows the use of the above array with segmented buttons
    var tipPercentages = [0.15, 0.20, 0.28, 0.0]
    let userDefaults = NSUserDefaults.standardUserDefaults();
    let customDefault = NSUserDefaults.standardUserDefaults();
    var tipPercentage = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        //setting a default tip level
       // var tipDefaultLocation: Int? = userDefaults.objectForKey("tipDefault") as! Int?
        //if(tipDefaultLocation == nil){
            //tipDefaultLocation = 2
          userDefaults.setInteger(0, forKey: "tipDefault" )
       tipSelect.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
        //userDefaults.synchronize()
        //let tipPercentage = tipPercentages[tipDefaultLocation!]
        
        switch(tipSelect.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.cyanColor()
        case 2:
            self.view.backgroundColor = UIColor.yellowColor()
        case 3:
            self.view.backgroundColor = UIColor.whiteColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
            break
        }
    }

    override func viewWillAppear(animated: Bool) {
        tipSelect.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
        if (tipSelect.selectedSegmentIndex == 3)
        {
            tipPercentages[3] = customDefault.doubleForKey("customPercent")
        }
        tipPercentage = tipPercentages[tipSelect.selectedSegmentIndex]
        let doubleValue : Double = NSString(string: billField.text!).doubleValue
        let tip = doubleValue * tipPercentage
        let total = doubleValue + tip
        
        tipLabel.text = String(format: "$%.2f", tip )
        totalLabel.text = String(format: "$%.2f", total)
        switch(tipSelect.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.cyanColor()
        case 2:
            self.view.backgroundColor = UIColor.yellowColor()
        case 3:
            self.view.backgroundColor = UIColor.whiteColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
            break
        }    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditBill(sender: AnyObject) {

        
        //correlates location to location in array
        tipPercentage = tipPercentages[tipSelect.selectedSegmentIndex]
        
        let doubleValue : Double = NSString(string: billField.text!).doubleValue
        let tip = doubleValue * tipPercentage
        let total = doubleValue + tip
        
        tipLabel.text = String(format: "$%.2f", tip )
        totalLabel.text = String(format: "$%.2f", total)
        
        switch(tipSelect.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.cyanColor()
        case 2:
            self.view.backgroundColor = UIColor.yellowColor()
        case 3:
            self.view.backgroundColor = UIColor.whiteColor()
        default:
            break
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   
}

