//
//  ImageTransition.swift
//  Facebook
//
//  Created by Michelle Harvey on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    var initialImageFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var selectedImageView = UIImageView()

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let destinationViewController = toViewController as! PhotoViewController
        destinationViewController.imageView.alpha = 0
        
        let transitionImage = UIImageView(image: selectedImageView.image)
        transitionImage.contentMode = selectedImageView.contentMode
        transitionImage.frame = initialImageFrame
        transitionImage.center.y = selectedImageView.center.y + 110
        
        let endWidth = CGFloat(320)
        let endHeight = (initialImageFrame.height / initialImageFrame.width) * endWidth
        let endCenterY = (destinationViewController.view.frame.height - endHeight) / 2

        containerView.addSubview(transitionImage)
        
        destinationViewController.backgroundView.backgroundColor = UIColor(white: 0, alpha: 0)
        UIView.animateWithDuration(duration, animations: {
            transitionImage.center = destinationViewController.view.center
            transitionImage.frame = CGRect(x: 0, y: endCenterY, width: endWidth, height: endHeight)
            destinationViewController.backgroundView.backgroundColor = UIColor(white: 0, alpha: 1)
        }) { (finished: Bool) -> Void in
            destinationViewController.imageView.alpha = 1
            transitionImage.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
