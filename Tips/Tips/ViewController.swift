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
    var tipPercentage = 0.15
    // Is it the first time loading?
    let loadingForFirstTime = NSUserDefaults.standardUserDefaults();
    
    
    let localeIdentifier = NSUserDefaults.standardUserDefaults();
    let userDefaults = NSUserDefaults.standardUserDefaults();
    let customDefault = NSUserDefaults.standardUserDefaults();
    //To remember bill amount accross retarts
    let restartBillAmount = NSUserDefaults.standardUserDefaults();
    var onAwakeTime = NSDate();
    
    let timeForRestartBillAmount = NSUserDefaults.standardUserDefaults()
    let checkRestartTime = NSUserDefaults.standardUserDefaults()
    
    let formatter = NSNumberFormatter();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onAwakeTime = NSDate();
        
        //if it is the first time loading
        loadingForFirstTime.setValue(Bool(true), forKey: "loadForFirstTime")
        loadingForFirstTime.synchronize()

        billField.text = checkRestartTime.valueForKey("restartValue") as? String

        
        //Locale identification default to US
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        // initialize key
        localeIdentifier.setValue(String("en_US"), forKey: "locale")
        //testing formatter
        print(formatter.stringFromNumber(1234.5678)!)
        
        tipLabel.text = formatter.stringFromNumber(0.00)!
        totalLabel.text = formatter.stringFromNumber(0.00)!
        
        //make the keyboard pop up
        billField.becomeFirstResponder()
        
        //load tip defaults from the NSUserDefaults object
        userDefaults.setInteger(0, forKey: "tipDefault" )
        tipSelect.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
        tipPercentages[3] = userDefaults.doubleForKey("customPercent")

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
    override func viewDidAppear(animated: Bool) {
        billField.text = checkRestartTime.valueForKey("restartValue") as? String
        print("Loaded")
    }
    
    override func viewWillAppear(animated: Bool) {
        billField.text = checkRestartTime.valueForKey("restartValue") as? String
        
        tipSelect.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")

        tipPercentages[3] = customDefault.doubleForKey("customPercent")
        tipPercentage = tipPercentages[tipSelect.selectedSegmentIndex]
        let doubleValue : Double = NSString(string: billField.text!).doubleValue
        let tip = doubleValue * tipPercentage
        let total = doubleValue + tip
        
        //set locale on view
        formatter.locale = NSLocale(localeIdentifier: localeIdentifier.valueForKey("locale") as! String)
        
        tipLabel.text = formatter.stringFromNumber(tip)!
            //String(format: "$%.2f", tip )
        totalLabel.text = formatter.stringFromNumber(total)!
            //String(format: "$%.2f", total)
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

        //Update the restartBillAmount
        restartBillAmount.setValue(billField.text!, forKey: "restartValue")
        restartBillAmount.synchronize()
        //print(checkRestartTime.valueForKey("appCloseTime") )
        
        print(billField.text!)
        //correlates percentage to number in location of array
        tipPercentage = tipPercentages[tipSelect.selectedSegmentIndex]
        
        let doubleValue : Double = NSString(string: billField.text!).doubleValue
        let tip = doubleValue * tipPercentage
        let total = doubleValue + tip
        
        tipLabel.text = formatter.stringFromNumber(tip)!
        //String(format: "$%.2f", tip )
        totalLabel.text = formatter.stringFromNumber(total)!
        //String(format: "$%.2f", total)
        
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

