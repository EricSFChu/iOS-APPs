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
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func defaultSegmentationChange(sender: AnyObject)
    {
        var tipPercentages = [0.15, 0.20, 0.28, 0.0]
        let tipDefaultPercentage = tipPercentages[tipDefaultSelect.selectedSegmentIndex]
    
        //use this to store the default location
        var tipDefaultLocation: Int? = userDefaults.objectForKey("tipDefault") as! Int?
        tipDefaultLocation = tipDefaultSelect.selectedSegmentIndex
        userDefaults.setObject(tipDefaultLocation!, forKey: "tipDefault")
        print(tipDefaultLocation!);
        switch(tipDefaultLocation!)
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
