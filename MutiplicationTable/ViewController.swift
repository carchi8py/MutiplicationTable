//
//  ViewController.swift
//  MutiplicationTable
//
//  Created by Chris Archibald on 10/7/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set UI in code
        createMultiplicationTableUI()
    }
    
    func createMultiplicationTableUI() {
        
        // Size Information (Screen Size?)
        print("bounds: \(UIScreen.mainScreen().bounds)")
        print("scale: \(UIScreen.mainScreen().scale)")
        
        // Width
        // height
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // text label
        var numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        numberLabel.backgroundColor = UIColor.orangeColor()
        numberLabel.text = "10"
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.font = UIFont.boldSystemFontOfSize(40)
        
        //view.addSubview(numberLabel)
        
        // view behind text label
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        var numberBarView = UIView(frame: CGRect(x: 0, y: statusBarHeight, width: screenWidth, height: 80))
        numberBarView.backgroundColor = UIColor.darkGrayColor()
        
        view.addSubview(numberBarView)
        numberBarView.addSubview(numberLabel)
        numberLabel.center = CGPoint(x: numberBarView.bounds.size.width / 2, y: numberBarView.bounds.size.height / 2)
        
        // Slider View
        
        // Uislider
        
        // text view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
