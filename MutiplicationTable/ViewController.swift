//
//  ViewController.swift
//  MutiplicationTable
//
//  Created by Chris Archibald on 10/7/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create properties
    var numberLabel: UILabel!
    var number: Int = 10
    var minValue = 1
    var maxValue = 12

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
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
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
        //If you use numberBarView.bound.height it is the hight of the object, not where it is on the screen.
        var sliderBarView = UIView(frame: CGRect(x: 0, y: numberBarView.frame.origin.y + numberBarView.frame.height, width: screenWidth, height: 40))
        sliderBarView.backgroundColor = UIColor.lightGrayColor()
        
        view.addSubview(sliderBarView)
        
        // Uislider
        
        var numberSlider = UISlider(frame: sliderBarView.bounds)
        numberSlider.minimumValue = Float(minValue)
        numberSlider.maximumValue = Float(maxValue)
        //order mater this has to come afterwards
        numberSlider.value = Float(number)
        sliderBarView.addSubview(numberSlider)
        
        // target/ action to connect the events
        numberSlider.addTarget(self, action: Selector("numberSliderChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // text view
        
    }
    
    func numberSliderChanged(slider: UISlider) {
        number = Int(slider.value)
        numberLabel.text = "\(number)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
