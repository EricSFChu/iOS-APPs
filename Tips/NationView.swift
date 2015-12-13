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
    @IBOutlet weak var britishFlag: UIImageView!
    @IBOutlet weak var frenchFlag: UIImageView!
    
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

    override func viewWillAppear(animated: Bool) {
        if(localeIdentifier.valueForKey("locale") as! String == "en_US" || localeIdentifier.valueForKey("locale") as! String == "en_US" )
        {
            self.view.backgroundColor = UIColor.blueColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
    
        UIView.animateWithDuration( 2, delay: 0.5, options: [UIViewAnimationOptions.CurveEaseInOut, UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { self.americanFlag.alpha = 0.5}, completion: nil)
        UIView.animateWithDuration( 2, delay: 1.0, options: [UIViewAnimationOptions.CurveEaseInOut, UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { self.britishFlag.alpha = 0.5}, completion: nil)
    
        UIView.animateWithDuration( 2, delay: 0.75, options: [UIViewAnimationOptions.CurveEaseInOut, UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { self.frenchFlag.alpha = 0.5}, completion: nil)
        
    }
}

    
