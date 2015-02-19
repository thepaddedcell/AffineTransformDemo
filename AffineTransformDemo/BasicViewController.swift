//
//  BasicViewController.swift
//  AffineTransformDemo
//
//  Created by Craig Stanford on 18/02/2015.
//

import UIKit

class BasicViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var startPoint: CGPoint!
    var transform: CGAffineTransform!
    var imageViews = Array<UIImageView>()

    func radiansFromDegrees(degrees: CGFloat) -> CGFloat {
        return degrees * (CGFloat(M_PI) / 180.0)
    }
    
    @IBAction func imagePanned(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(self.view)
        switch sender.state {
        case .Began:
            self.startPoint = point
            self.transform = self.imageView.transform
        case .Changed:
            let xDelta = point.x - self.startPoint.x
            let yDelta = point.y - self.startPoint.y
            self.imageView.center = CGPointMake(self.view.center.x + xDelta, self.view.center.y + yDelta)
            let factor = xDelta / 10
            self.imageView.transform = CGAffineTransformRotate(self.transform, radiansFromDegrees(factor))

        case .Ended:
            fallthrough
        default:
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.imageView.center = self.view.center
            })
            self.applyTransform(self.imageView, transform: CGAffineTransformIdentity)
        }
    }
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer) {
         self.applyTransform(self.imageView, transform: CGAffineTransformRotate(self.imageView.transform, self.radiansFromDegrees(45)))
    }

    @IBAction func imageLongPressed(sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .Began:
            let newImageView = UIImageView(frame: self.imageView.bounds)
            newImageView.center = self.imageView.center
            newImageView.image = self.imageView.image
            self.view.insertSubview(newImageView, belowSubview: self.imageView)
            self.imageViews.insert(newImageView, atIndex: 0)
            self.applyTransform(self.imageView, transform: CGAffineTransformScale(self.imageView.transform, 1.1, 1.1))
        case .Ended:
            fallthrough
        default:
            for imageViewObject in self.imageViews {
                let index = find(self.imageViews, imageViewObject)! + 1
                let scaleTransform = CGAffineTransformMakeScale(1 - 0.1 * CGFloat(index), 1 - 0.1 * CGFloat(index))
                let translateTransform = CGAffineTransformMakeTranslation(0, 30.0 * CGFloat(index))
                self.applyTransform(imageViewObject, transform: CGAffineTransformConcat(scaleTransform, translateTransform))
            }
            self.applyTransform(self.imageView, transform: CGAffineTransformIdentity)
        }
    }
    
    func applyTransform(view: UIView, transform: CGAffineTransform) {
        UIView.beginAnimations("nameOfAnimation", context: nil)
        UIView.setAnimationDuration(0.3)
        UIView.setAnimationBeginsFromCurrentState(true)
        view.transform = transform
        UIView.commitAnimations()
    }
}
