//
//  ViewController.swift
//  TouchDraw2
//
//  Created by Paul Vagner on 12/23/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBAction func SavePic(sender: AnyObject) {

        
//        UIGraphicsBeginImageContext(mainImageView.bounds.size)
//        mainImageView.image?.drawInRect(CGRect(x: 0, y: 0,
//            width: mainImageView.frame.size.width, height: mainImageView.frame.size.height))
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
//        presentViewController(activity, animated: true, completion: nil)
    
    }
    
    //creates the button action outlet
    @IBAction func undo(sender: AnyObject) {
        
        if(view as? DrawView)?.lines.count > 0 {
            
            (view as? DrawView)?.lines.removeLast()
            
        }
        view.setNeedsDisplay()
    }
   
    @IBAction func clear(sender: AnyObject) {
        (view as? DrawView)?.lines = []
        view.setNeedsDisplay()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //       fsButton.innerColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    
        
        fsButton.innerColor = DrawData.mainData().fillColor
        fsButton.outerColor = DrawData.mainData().strokeColor
        
        _nc.addObserverForName("UpdateColors", object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.fsButton.innerColor = DrawData.mainData().fillColor
            self.fsButton.outerColor = DrawData.mainData().strokeColor
            
        }
        
    }
    
    @IBOutlet weak var fsButton: fillStrokeButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            
            switch DrawData.mainData().chosenTool {
                // Scribble
            case 1 :
                let newScribble = Scribble()
                newScribble.points.append(touch.locationInView(view))
                newScribble.strokeColor = DrawData.mainData().strokeColor
                newScribble.fillColor = DrawData.mainData().fillColor
                newScribble.strokeWidth = DrawData.mainData().strokeWidth
                (view as? DrawView)?.lines.append(newScribble)
            case 2 :
                startShape(.Circle, withTouch: touch)
            case 3 :
                startShape(.Triangle, withTouch: touch)
            case 4 :
                startShape(.Rectangle, withTouch: touch)
            case 5 :
                startShape(.Diamond, withTouch: touch)
            case 6 :
                startShape(.Star, withTouch: touch)
                
                //Line
            default :
                let newLine = Line()
                
                newLine.start = touch.locationInView(view)
                newLine.strokeColor = DrawData.mainData().strokeColor
                newLine.fillColor = DrawData.mainData().fillColor
                newLine.strokeWidth = DrawData.mainData().strokeWidth
                
                //look at View as DrawView if not, then will not crash
                (view as? DrawView)?.lines.append(newLine)
                
            }
            
            view.setNeedsDisplay()
        }
    }
    
    func startShape(type: ShapeType, withTouch touch: UITouch) {
        
        //SHAPE)
        
        // initializing shape
        let shape = Shape(type: type)
        // sets start location of the shape (top left corner of the shape)
        shape.start = touch.locationInView(view)
        // sets color of the shape
        shape.strokeColor = DrawData.mainData().strokeColor
        shape.fillColor = DrawData.mainData().fillColor
        shape.strokeWidth = DrawData.mainData().strokeWidth
        
        
        (view as? DrawView)?.lines.append(shape)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            if let currentScribble = (view as? DrawView)?.lines.last as? Scribble {
                currentScribble.points.append(touch.locationInView(view))
                view.setNeedsDisplay()
                
            } else if let currentLine = (view as? DrawView)?.lines.last {
                currentLine.end = touch.locationInView(view)
                view.setNeedsDisplay()
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let popup = segue.destinationViewController as? ToolVC {
            
            popup.popoverPresentationController?.delegate = self
            
        }
        
        
        if let popup = segue.destinationViewController as? ColorsVC {
            
            popup.popoverPresentationController?.delegate = self
            
        }
        
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.None
        
    }
    
}

