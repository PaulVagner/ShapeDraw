//
//  StarShape.swift
//  TouchDraw2
//
//  Created by Paul Vagner on 2/6/16.
//  Copyright © 2016 Paul Vagner. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class StarShape {

let context = UIGraphicsGetCurrentContext()

func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
    
    return CGPointMake(radius * cos(angle) + offset.x, radius * sin(angle) + offset.y)
}

func starPathInRect(rect: CGRect) -> UIBezierPath {
    let path = UIBezierPath()
    let starExtrusion: CGFloat = 30.0
    let center = CGPointMake(rect.width / 2.0, rect.height / 2.0)
    let pointsOnStar = 5 + arc4random() % 10
    var angle: CGFloat = -CGFloat(M_PI / 2.0)
    let angleIncrement = CGFloat(M_PI * 2.0 / Double(pointsOnStar))
    let radius = rect.width / 2.0
    
    var firstPoint = true
    
    for _ in 1...pointsOnStar {
        
        let point = pointFrom(angle, radius: radius, offset: center)
        let nextPoint = pointFrom(angle + angleIncrement, radius: radius, offset: center)
        let midPoint = pointFrom(angle + angleIncrement / 2.0, radius: starExtrusion, offset: center)
        
        
        if firstPoint {
            firstPoint = false
            path.moveToPoint(point)
        }
        
        path.addLineToPoint(midPoint)
        path.addLineToPoint(nextPoint)
        
        angle += angleIncrement
    }
    
    path.closePath()
    CGContextFillPath(context)
    return path
    }
    
}




