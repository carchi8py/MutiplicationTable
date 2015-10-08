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
    var numberBarView: UIView!
    var sliderBarView: UIView!
    var numberSlider: UISlider!
    var textView: UITextView!
    
    var number: Int = 10
    var minValue = 1
    var maxValue = 99

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
        numberLabel.text = "\(number)"
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.font = UIFont.boldSystemFontOfSize(40)
        
        //view.addSubview(numberLabel)
        
        // view behind text label
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        numberBarView = UIView(frame: CGRect(x: 0, y: statusBarHeight, width: screenWidth, height: 80))
        numberBarView.backgroundColor = UIColor.darkGrayColor()
        
        view.addSubview(numberBarView)
        numberBarView.addSubview(numberLabel)
        numberLabel.center = CGPoint(x: numberBarView.bounds.size.width / 2, y: numberBarView.bounds.size.height / 2)
        
        // Slider View
        //If you use numberBarView.bound.height it is the hight of the object, not where it is on the screen.
        sliderBarView = UIView(frame: CGRect(x: 0, y: numberBarView.frame.origin.y + numberBarView.frame.height, width: screenWidth, height: 40))
        sliderBarView.backgroundColor = UIColor.lightGrayColor()
        
        view.addSubview(sliderBarView)
        
        // Uislider
        
        numberSlider = UISlider(frame: sliderBarView.bounds)
        numberSlider.minimumValue = Float(minValue)
        numberSlider.maximumValue = Float(maxValue)
        //order mater this has to come afterwards
        numberSlider.value = Float(number)
        sliderBarView.addSubview(numberSlider)
        
        // target/ action to connect the events
        numberSlider.addTarget(self, action: Selector("numberSliderChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // text view
        let textAreaY = sliderBarView.frame.origin.y + sliderBarView.frame.height
        let textAreaHeight = screenHeight - textAreaY
        textView = UITextView(frame: CGRect(x: 0, y: textAreaY, width: screenWidth, height:textAreaHeight))
        textView.backgroundColor = UIColor.whiteColor()
        
        textView.text = "Line 1\nLine 2"
        textView.font = UIFont.systemFontOfSize(20)
        textView.textAlignment = NSTextAlignment.Center
        
        view.addSubview(textView)
        
        textView.text = generateMuliplicationTable(number)
    }
    
    func generateMuliplicationTable(value: Int) -> String {
        var output = ""
        for i in minValue...maxValue {
            output += "\(i) x \(value) = \(i * value)\n"
        }
        return output
    }
    
    func numberSliderChanged(slider: UISlider) {
        number = Int(slider.value)
        numberLabel.text = "\(number)"
        textView.text = generateMuliplicationTable(number)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
