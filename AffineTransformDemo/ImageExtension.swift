//
//  ReffindImages.swift
//  reffind
//
//  Created by Craig Stanford on 6/01/2015.
//

import UIKit

extension UIImage {
    class func imageWithView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
        view.layer.renderInContext(UIGraphicsGetCurrentContext());
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
    
    class func imageWithColor(color: UIColor, size:CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size);
        let context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        let rect = CGRectMake(0, 0, size.width, size.height)
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image
    }
    
    class func imageWithBezierPathsAndColors(paths: Array<UIBezierPath>, colors: Array<UIColor>, size:CGSize) -> UIImage {
        let widthScale = size.width/100.0
        let heightScale = size.height/100.0
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        let context: CGContextRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        paths.map{ (path: UIBezierPath) -> () in
            path.applyTransform(CGAffineTransformMakeScale(widthScale, heightScale))
            let color = colors[find(paths, path)!]
            color.setFill();
            path.fill();
        }
        let image:  UIImage = UIGraphicsGetImageFromCurrentImageContext();
        CGContextRestoreGState(context);
        UIGraphicsEndImageContext();
        return image;
    }
    
    class func imageWithBezierPaths(paths: Array<UIBezierPath>, colour: UIColor, size:CGSize) -> UIImage {
        let widthScale = size.width/100.0
        let heightScale = size.height/100.0
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        let context: CGContextRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        colour.setFill();
        paths.map{ (path: UIBezierPath) -> () in
            path.applyTransform(CGAffineTransformMakeScale(widthScale, heightScale))
            path.fill();
        }
        let image:  UIImage = UIGraphicsGetImageFromCurrentImageContext();
        CGContextRestoreGState(context);
        UIGraphicsEndImageContext();
        return image;
    }
    
    class func imageWithBezierPath(path: UIBezierPath, colour: UIColor, size:CGSize) -> UIImage {
        let widthScale = size.width/100.0
        let heightScale = size.height/100.0
        path.applyTransform(CGAffineTransformMakeScale(widthScale, heightScale))
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        let context: CGContextRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        colour.setFill();
        path.fill();
        let image:  UIImage = UIGraphicsGetImageFromCurrentImageContext();
        CGContextRestoreGState(context);
        UIGraphicsEndImageContext();
        return image;
    }
    
    class func imageWithStrokedBezierPath(path: UIBezierPath, strokeColor: UIColor, size:CGSize) -> UIImage {
        let widthScale = size.width/100.0
        let heightScale = size.height/100.0
        path.applyTransform(CGAffineTransformMakeScale(widthScale, heightScale))
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        let context: CGContextRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        strokeColor.setStroke();
        path.stroke();
        let image:  UIImage = UIGraphicsGetImageFromCurrentImageContext();
        CGContextRestoreGState(context);
        UIGraphicsEndImageContext();
        return image;
    }

}

