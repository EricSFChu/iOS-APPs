//
//  NationView.swift
//  Tips
//
//  Created by Eric Chu on 12/10/15.
//  Copyright © 2015 Eric Chu. All rights reserved.
//

import UIKit

class NationView: UIViewController
{
    @IBOutlet weak var americanFlag: UIImageView!
    let localeIdentifier = NSUserDefaults.standardUserDefaults();
    
    @IBAction func changeToUSD(sender: AnyObject) {
    self.view.backgroundColor = UIColor.blueColor()
        localeIdentifier.setValue(String("en_US"), forKey: "locale")
        localeIdentifier.synchronize()
    }
    
    
    @IBAction func GBP(sender: AnyObject) {
    self.view.backgroundColor = UIColor.redColor()
        localeIdentifier.setValue(String("en_GB"), forKey: "locale")
        localeIdentifier.synchronize()
    }
    
    
    
    @IBAction func EURO(sender: AnyObject) {
    self.view.backgroundColor = UIColor.blueColor()
        localeIdentifier.setValue(String("fr_FR"), forKey: "locale")
        localeIdentifier.synchronize()
    }
    
    
    
    
    
    
    
    
    
}