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
    
    //This is the variable for NSUserDefault access
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func defaultSegmentationChange(sender: AnyObject)
    {
        var tipPercentages = [0.15, 0.20, 0.28, 0.0]
        var tipDefaultPercentage = tipPercentages[tipDefaultSelect.selectedSegmentIndex]
    
        //use this to store the default location
     
        //var tipDefaultLocation:Int = tipDefaultSelect.selectedSegmentIndex
        
        //set the user default location for tip NSUserDefault
        userDefaults.setInteger(tipDefaultSelect.selectedSegmentIndex, forKey: "tipDefault")
        userDefaults.synchronize()
        print(tipDefaultSelect.selectedSegmentIndex);
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
