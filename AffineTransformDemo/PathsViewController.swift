//
//  PathsViewController.swift
//  AffineTransformDemo
//
//  Created by Craig Stanford on 19/02/2015.
//

import UIKit

class PathsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scaledView = UIImageView(frame: CGRectMake(50, 200, 400, 400))
        scaledView.contentMode = UIViewContentMode.ScaleAspectFill
        scaledView.image = UIImage.imageWithBezierPath(UIBezierPath.rfPathForCross(), colour: UIColor.redColor(), size: CGSizeMake(100, 100))
        self.view.addSubview(scaledView)
        
        let transformedView = UIImageView(frame: CGRectMake(500, 200, 400, 400))
        transformedView.contentMode = UIViewContentMode.ScaleAspectFill
        transformedView.image = UIImage.imageWithBezierPath(UIBezierPath.rfPathForCross(), colour: UIColor.redColor(), size: transformedView.bounds.size)
        self.view.addSubview(transformedView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
