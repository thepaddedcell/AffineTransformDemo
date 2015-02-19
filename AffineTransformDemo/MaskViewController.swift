//
//  MaskViewController.swift
//  AffineTransformDemo
//
//  Created by Craig Stanford on 19/02/2015.
//  Copyright (c) 2015 MonsterBomb Pty Ltd. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var maskView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.maskView = UIImageView(frame: self.imageView.bounds)
        self.maskView.contentMode = UIViewContentMode.Center
        self.maskView.image = UIImage.imageWithBezierPath(UIBezierPath.rfPathForTick(), colour: UIColor.blackColor(), size: CGSizeMake(CGRectGetHeight(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds)))
        self.maskView.transform = CGAffineTransformMakeScale(1000, 1000)
        self.imageView.maskView = self.maskView
    }

    @IBAction func imageTapped(sender: AnyObject) {
        if CGAffineTransformIsIdentity(self.maskView.transform) {
            self.applyTransform(self.maskView, transform: CGAffineTransformMakeScale(0, 0))
        } else {
            self.applyTransform(self.maskView, transform: CGAffineTransformIdentity)
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
