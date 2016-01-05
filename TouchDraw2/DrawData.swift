//
//  DrawData.swift
//  TouchDraw2
//
//  Created by Paul Vagner on 1/4/16.
//  Copyright © 2016 Paul Vagner. All rights reserved.
//

import UIKit

let _nc = NSNotificationCenter.defaultCenter()

private let _singleton = DrawData()

class DrawData: NSObject {

    class func mainData() -> DrawData { return _singleton }
    
    var fillRGBA: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (1,0,0,1) {
        
        didSet {
            
            // update button on vc
            _nc.postNotificationName("UpdateColors", object: nil)
            
        }
        
    }
    
    var fillColor: UIColor {
        
        return UIColor(red: DrawData.mainData().fillRGBA.r, green: DrawData.mainData().fillRGBA.g, blue: DrawData.mainData().fillRGBA.b, alpha: DrawData.mainData().fillRGBA.a)
        
    }
    
    var strokeRGBA: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0,0,0,1) {
        
        didSet {
            
            // update button on vc
            _nc.postNotificationName("UpdateColors", object: nil)
            
        }
        
    }
    
    var strokeColor: UIColor {
        
        return UIColor(red: DrawData.mainData().strokeRGBA.r, green: DrawData.mainData().strokeRGBA.g, blue: DrawData.mainData().strokeRGBA.b, alpha: DrawData.mainData().strokeRGBA.a)
        
    }
    
    var strokeWidth: CGFloat = 0.5
    
    var chosenTool: Int = 0
    
}


