//
//  SettingsViewController.swift
//  Tips
//
//  Created by Eric Chu on 12/8/15.
//  Copyright © 2015 Eric Chu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipDefaultSelect: UISegmentedControl!
    @IBOutlet weak var customAmount: UITextField!
    @IBOutlet weak var currentCustomAmount: UILabel!
    

    
    
    //This is the variable for NSUserDefault access
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var customDefault = NSUserDefaults.standardUserDefaults()
    var tipPercentages = [0.15, 0.20, 0.28, 0.0]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onEditDefault(sender: AnyObject) {
        let userPercentInput: Int = NSString(string: customAmount.text!).integerValue
        tipPercentages[3] = Double(userPercentInput) * 0.01
        customDefault.setDouble(tipPercentages[3], forKey:"customPercent")
        customDefault.synchronize()
    }
    @IBAction func defaultSegmentationChange(sender: AnyObject)
    {
        
       // var tipDefaultPercentage = tipPercentages[tipDefaultSelect.selectedSegmentIndex]
    
        //use this to store the default location
     
        //var tipDefaultLocation:Int = tipDefaultSelect.selectedSegmentIndex
        
        //set the user default location for tip NSUserDefault
        userDefaults.setInteger(tipDefaultSelect.selectedSegmentIndex, forKey: "tipDefault")
        userDefaults.synchronize()
        print(tipDefaultSelect.selectedSegmentIndex);
        
        
        //custom default percentage to be returned to main view controller
        

        
        //changes the color of the UI depending on selectedSegmentIndex
        switch(tipDefaultSelect.selectedSegmentIndex)
        {
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
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEdit(sender: AnyObject) {
   
            let userPercentInput: Int = NSString(string: customAmount.text!).integerValue
            tipPercentages[3] = Double(userPercentInput) * 0.01
            customDefault.setDouble(tipPercentages[3], forKey:"customPercent")
            customDefault.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        tipDefaultSelect.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
        currentCustomAmount.text = String(Int(customDefault.doubleForKey("customPercent") * 100)) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
       /* self.firstView.alpha = 0
        self.secondView.alpha = 1
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.firstView.alpha = 1
            self.secondView.alpha = 0
        })
        })*/
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
