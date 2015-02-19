//
//  ReffindPaths.swift
//  reffind
//
//  Created by Craig Stanford on 8/01/2015.
//

import UIKit

extension UIBezierPath {
    class func rfPathForTick() -> UIBezierPath {
        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(40.6, 80))
        bezier2Path.addLineToPoint(CGPointMake(13, 52.4))
        bezier2Path.addLineToPoint(CGPointMake(26.1, 39.2))
        bezier2Path.addLineToPoint(CGPointMake(40.6, 53.7))
        bezier2Path.addLineToPoint(CGPointMake(73.9, 20.4))
        bezier2Path.addLineToPoint(CGPointMake(87, 33.6))
        bezier2Path.addLineToPoint(CGPointMake(40.6, 80))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4
        return bezier2Path
    }
    
    class func rfPathForCross() -> UIBezierPath {
        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(80.3, 33.1))
        bezier2Path.addLineToPoint(CGPointMake(67.1, 19.9))
        bezier2Path.addLineToPoint(CGPointMake(50.5, 36.5))
        bezier2Path.addLineToPoint(CGPointMake(33.9, 19.9))
        bezier2Path.addLineToPoint(CGPointMake(20.7, 33.1))
        bezier2Path.addLineToPoint(CGPointMake(37.3, 49.7))
        bezier2Path.addLineToPoint(CGPointMake(33.9, 53.2))
        bezier2Path.addLineToPoint(CGPointMake(20.7, 66.3))
        bezier2Path.addLineToPoint(CGPointMake(33.9, 79.5))
        bezier2Path.addLineToPoint(CGPointMake(50.5, 62.9))
        bezier2Path.addLineToPoint(CGPointMake(54, 66.3))
        bezier2Path.addLineToPoint(CGPointMake(67.1, 79.5))
        bezier2Path.addLineToPoint(CGPointMake(80.3, 66.3))
        bezier2Path.addLineToPoint(CGPointMake(63.7, 49.7))
        bezier2Path.addLineToPoint(CGPointMake(80.3, 33.1))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4
        return bezier2Path
    }
}