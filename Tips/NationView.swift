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
    
    
    @IBAction func changeToUSD(sender: AnyObject) {
    self.view.backgroundColor = UIColor.blueColor()
    }
    
    
    @IBAction func GBP(sender: AnyObject) {
    self.view.backgroundColor = UIColor.redColor()
    }
    
    
    
    @IBAction func EURO(sender: AnyObject) {
    self.view.backgroundColor = UIColor.blueColor()
    }
    
    
    
    
    
    
    
    
    
}