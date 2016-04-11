//  ColorsVC.swift
//  TouchDraw2
//  Created by Paul Vagner on 1/3/16.
//  Copyright © 2016 Paul Vagner. All rights reserved.
//

import UIKit

class ColorsVC: UIViewController {
    
    override var preferredContentSize: CGSize {
        
        get {
            return CGSize(width: 300, height: 410)
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
    var redValue: CGFloat = 0.5
    var greenValue: CGFloat = 0.5
    var opacityValue: CGFloat = 0.5
    var blueValue: CGFloat = 0.5
    var isFill: Bool = true
    
    
    @IBOutlet weak var redLabelValue: UILabel!
    @IBOutlet weak var blueLabelValue: UILabel!
    @IBOutlet weak var greenLabelValue: UILabel!
    @IBOutlet weak var strokeLabelValue: UILabel!
    @IBOutlet weak var opacityLabelValue: UILabel!
    @IBOutlet weak var fsButton: fillStrokeButton!
    
    @IBOutlet weak var redSlider: TouchSlider!
    @IBAction func redSliderMoved(sender: TouchSlider) {
        redValue = CGFloat(sender.value)
        displayColors()
        redLabelValue.text = "Red" + " \(redValue)"
        print("redSliderValue is \(redValue.description)")
    }
    
    @IBOutlet weak var greenSlider: TouchSlider!
    @IBAction func greenSliderMoved(sender: TouchSlider) {
        greenValue = CGFloat(sender.value)
        displayColors()
        greenLabelValue.text = "Green" + " \(greenValue)"
//        print("greenSliderValue is \(greenValue)")
        
    }
    
    @IBOutlet weak var blueSlider: TouchSlider!
    @IBAction func blueSliderMoved(sender: TouchSlider) {
        blueValue = CGFloat(sender.value)
        displayColors()
        blueLabelValue.text = "Blue" + " \(blueValue)"
//        print("blueSliderValue is \(blueValue)")
    }
    
    @IBOutlet weak var opacitySlider: TouchSlider!
    @IBAction func opacitySliderMoved(sender: TouchSlider) {
        opacityValue = CGFloat(sender.value)
        displayColors()
        opacityLabelValue.text = "Opacity" + " \(opacityValue)"
//        print("opacitySliderValue is \(opacityValue)")
    }
    
    @IBOutlet weak var strokeSlider: TouchSlider!
    @IBAction func strokeSliderMoved(sender: TouchSlider) {
        
        DrawData.mainData().strokeWidth = CGFloat(sender.value)
//        print("strokeValue is \(DrawData.mainData().strokeWidth)")
        strokeLabelValue.text = "Stroke Width" + " \(strokeSlider.value)"
    }
    
    @IBAction func fsButtonTapped(sender: fillStrokeButton) {
        
        isFill = !isFill
        
        if isFill {
            
            redSlider.value = DrawData.mainData().fillRGBA.r
            blueSlider.value = DrawData.mainData().fillRGBA.g
            greenSlider.value = DrawData.mainData().fillRGBA.b
            opacitySlider.value = DrawData.mainData().fillRGBA.a
            
        } else {
            
            redSlider.value = DrawData.mainData().strokeRGBA.r
            blueSlider.value = DrawData.mainData().strokeRGBA.g
            greenSlider.value = DrawData.mainData().strokeRGBA.b
            opacitySlider.value = DrawData.mainData().strokeRGBA.a
            
        }

    }
    
    func displayColors() {
        
        if isFill {
            
            DrawData.mainData().fillRGBA = (
                
                redSlider.value,
                blueSlider.value,
                greenSlider.value,
                opacitySlider.value
                
            )
            
        } else {
            
            DrawData.mainData().strokeRGBA = (
                
                redSlider.value,
                blueSlider.value,
                greenSlider.value,
                opacitySlider.value
                
            )
            
        }
        
        fsButton.innerColor = DrawData.mainData().fillColor
        fsButton.outerColor = DrawData.mainData().strokeColor
    
    }
    
   @IBAction func close(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        redSlider.value = DrawData.mainData().fillRGBA.r
        blueSlider.value = DrawData.mainData().fillRGBA.g
        greenSlider.value = DrawData.mainData().fillRGBA.b
        opacitySlider.value = DrawData.mainData().fillRGBA.a
        strokeSlider.value = DrawData.mainData().strokeWidth
        displayColors()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




