//
//  DrawView.swift
//  TouchDraw2
//
//  Created by Paul Vagner on 12/23/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//
import UIKit
import QuartzCore
class DrawView: UIView {
    
    //array of lines
    var lines = [Line] ()
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        for line in lines {
            
            if let start = line.start, let end = line.end{
                
                // checks if line has fill color and does something with it
                if let fillColor = line.fillColor {
                    
                    fillColor.set()
                    //
                    if let shape = line as? Shape {
                        // "??" means default
                        let width = end.x - start.x
                        let height = end.y - start.y
                        
                        var rect = CGRect(x: start.x, y: start.y, width: width, height: height)
                        
                        switch shape.type ?? .Rectangle {
                            
                        case .Circle :
                            
                            CGContextFillEllipseInRect(context, rect)
                            
                        case .Triangle :
                            
                            let top = CGPoint(x: width / 2 + start.x ,y: start.y)
                            let right = end
                            let left = CGPoint(x: start.x ,y: end.y)
                            
                            //moves cursor to a specific point
                            CGContextMoveToPoint(context, top.x, top.y)
                            //adds a line
                            CGContextAddLineToPoint(context, right.x, right.y)
                            // adds a line
                            CGContextAddLineToPoint(context, left.x, left.y)
                            // adds a line
                            CGContextAddLineToPoint(context, top.x, top.y) //closes triangle
                            // fills the shape on the inside
                            CGContextFillPath(context)
                            
                            
                            
                        case .Rectangle :
                            
                            CGContextFillRect(context, rect)
                            
                        case .Diamond :
                            
                            let top = CGPoint(x: width / 2 + start.x, y: start.y)
                            let right = CGPoint(x: end.x, y: height / 2 + start.y)
                            let bottom = CGPoint(x: width / 2 + start.x, y: end.y)
                            let left = CGPoint(x: start.x, y: height / 2 + start.y)
                            
                            
                            //moves cursor to a specific point
                            CGContextMoveToPoint(context, top.x, top.y)
                            //adds a line
                            CGContextAddLineToPoint(context, right.x, right.y)
                            // adds a line
                            CGContextAddLineToPoint(context, bottom.x, bottom.y)
                            // adds a line
                            CGContextAddLineToPoint(context, left.x, left.y)
                            // adds a line
                            CGContextAddLineToPoint(context, top.x, top.y) //closes diamond
                            // fills the shape on the inside
                            CGContextFillPath(context)
                            
                        case .Star :
                            CGContextFillEllipseInRect(context, rect)
                            
                            let maxWH = rect.width > rect.height ? rect.width : rect.height
                            
                            rect.size.width = maxWH
                            rect.size.height = maxWH
                            
                            let star = StarShape()
                            star.starPathInRect(context, rect: rect)
//                            CGContextDrawLayerInRect(context, rect, StarShape())
                            
                        }
                    }
                    
                }
                
                // checks if line has stroke color and applies it
                if let strokeColor = line.strokeColor {
                    
                    strokeColor.set()
                    
                    CGContextSetLineWidth(context, line.strokeWidth)
                    
                    CGContextSetLineCap(context, .Round)
                    CGContextSetLineJoin(context, .Round)
                    
                    
                    if let shape = line as? Shape {
                        
                        
                        // "??" means default
                        let width = end.x - start.x
                        let height = end.y - start.y
                        
                        var rect = CGRect(x: start.x, y: start.y, width: width, height: height)
                        
                        switch shape.type ?? .Rectangle {
                            
                        case .Circle :
                            
                            CGContextStrokeEllipseInRect(context, rect)
                            
                        case .Triangle :
                            
                            let top = CGPoint(x: width / 2 + start.x ,y: start.y)
                            let right = end
                            let left = CGPoint(x: start.x ,y: end.y)
                            
                            //moves cursor to a specific point
                            CGContextMoveToPoint(context, top.x, top.y)
                            //adds a line
                            CGContextAddLineToPoint(context, right.x, right.y)
                            // adds a line
                            CGContextAddLineToPoint(context, left.x, left.y)
                            // adds a line
                            CGContextAddLineToPoint(context, top.x, top.y) //closes triangle
                            // fills the shape on the inside
                            CGContextStrokePath(context)
                            
                            
                            
                        case .Rectangle :
                            
                            CGContextStrokeRect(context, rect)
                            
                        case .Diamond :
                            
                            let top = CGPoint(x: width / 2 + start.x, y: start.y)
                            let right = CGPoint(x: end.x, y: height / 2 + start.y)
                            let bottom = CGPoint(x: width / 2 + start.x, y: end.y)
                            let left = CGPoint(x: start.x, y: height / 2 + start.y)
                            
                            
                            //moves cursor to a specific point
                            CGContextMoveToPoint(context, top.x, top.y)
                            //adds a line
                            CGContextAddLineToPoint(context, right.x, right.y)
                            // adds a line
                            CGContextAddLineToPoint(context, bottom.x, bottom.y)
                            // adds a line
                            CGContextAddLineToPoint(context, left.x, left.y)
                            // adds a line
                            CGContextAddLineToPoint(context, top.x, top.y) //closes diamond
                            // fills the shape on the inside
                            CGContextStrokePath(context)
                            
<<<<<<< HEAD
                        case .Star :
                            CGContextFillEllipseInRect(context, rect)
//                            func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
//                                
//                            return CGPointMake(radius * cos(angle) + offset.x, radius * sin(angle) + offset.y)
//                            }
//                            
//                            func starPathInRect(rect: CGRect) -> UIBezierPath {
//                                let path = UIBezierPath()
//                                
//                                let starExtrusion: CGFloat = 20.0
//                                
//                                let center = CGPointMake(rect.width / 2.0, rect.height / 2.0)
//                                
//                                let pointsOnStar = 5 + arc4random() % 10
//                                
//                                var angle: CGFloat = -CGFloat(M_PI / 2.0)
//                                let angleIncrement = CGFloat(M_PI * 2.0 / Double(pointsOnStar))
//                                let radius = rect.width / 2.0
//                                
//                                var firstPoint = true
//                                
//                                for i in 1...pointsOnStar {
//                                    
//                                    let point = pointFrom(angle, radius: radius, offset: center)
//                                    let nextPoint = pointFrom(angle + angleIncrement, radius: radius, offset: center)
//                                    let midPoint = pointFrom(angle + angleIncrement / 2.0, radius: starExtrusion, offset: center)
//                                    
//                                    if firstPoint {
//                                        firstPoint = false
//                                        path.moveToPoint(point)
//                                    }
//                                    
//                                    path.addLineToPoint(midPoint)
//                                    path.addLineToPoint(nextPoint)
//                                    
//                                    angle += angleIncrement
//                                }
//                                
//                                path.closePath()
//                                CGContextStrokePath(context)
//                                return path
//                            }

=======
                        case .Star:
                            
                            let maxWH = rect.width > rect.height ? rect.width : rect.height
                            
                            rect.size.width = maxWH
                            rect.size.height = maxWH
                            
                            
                            let star = StarShape()
                            star.starPathInRect(context, rect: rect, stroke: true)
                            
>>>>>>> newfeatures
                        }
                        
                    } else {
                        
                        //creates start point for line
                        CGContextMoveToPoint(context, start.x, start.y)
                        
                        if let scribble = line as? Scribble {
                            
                            CGContextAddLines(context, scribble.points, scribble.points.count)
                            
                        }
                        
                        CGContextAddLineToPoint(context, end.x, end.y)
                        CGContextStrokePath(context)
                        
                    }
                    
                }
                
            }
            
        }
        
        UIColor.blueColor()
        
    }
    
}

class Line {
    
    //sets location of the object
    var start: CGPoint?
    var end: CGPoint?
    
    //sets color values for the object
    var strokeColor: UIColor?
    var fillColor: UIColor?
    
    //sets the thicknes of the stroke
    var strokeWidth: CGFloat = 0
    
}

//this subclass allows access to the "Line" array in the class "DrawView"
class Scribble: Line {
    
    var points = [CGPoint] () {
        
        didSet {
            
            //adds a new point to the previous point as a line.
            start = points.first
            end = points.last
            
        }
        
    }
}
// creates set of allowable parameters
enum ShapeType {
    
    // creates the allowable shape types
    case Rectangle, Circle, Triangle, Diamond, Star
    
}
// creates a new class for the Shape - "Line" is subclass
class Shape: Line{
    //sets the variable of types as ShapeType
    var type: ShapeType!
    //initializer
    init(type: ShapeType) {
        //
        self.type = type
        
    }
    
}

