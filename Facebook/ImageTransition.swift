//
//  ImageTransition.swift
//  Facebook
//
//  Created by Michelle Harvey on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    // MARK: Properties
    var initialImageFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var selectedImageView = UIImageView()

    
    // MARK: Custom Transition Methods
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let destinationViewController = toViewController as! PhotoViewController
        destinationViewController.scrollView.alpha = 0
        destinationViewController.scrollView.contentOffset.x = CGFloat(destinationViewController.currentImageViewIndex * 320)

        let transitionImage = buildTransitionImage()
        let finalImageFrame = buildFinalImageFrame(destinationViewController)
        
        containerView.addSubview(transitionImage)
        
        destinationViewController.backgroundView.backgroundColor = UIColor(white: 0, alpha: 0)
        UIView.animateWithDuration(duration, animations: {
            transitionImage.center = destinationViewController.view.center
            transitionImage.frame = finalImageFrame
            destinationViewController.backgroundView.backgroundColor = UIColor(white: 0, alpha: 1)
        }) { (finished: Bool) -> Void in
            destinationViewController.scrollView.alpha = 1
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
    
    private func buildTransitionImage() -> UIImageView {
        let transitionImage = UIImageView(image: selectedImageView.image)
        transitionImage.contentMode = selectedImageView.contentMode
        transitionImage.frame = initialImageFrame
        transitionImage.center.y = selectedImageView.center.y + 110
        
        return transitionImage
    }
    
    private func buildFinalImageFrame(destinationViewController: PhotoViewController) -> CGRect {
        let endWidth = CGFloat(320)
        let endHeight = (initialImageFrame.height / initialImageFrame.width) * endWidth
        let endCenterY = (destinationViewController.view.frame.height - endHeight) / 2
        
        return CGRect(x: 0, y: endCenterY, width: endWidth, height: endHeight)
    }
}
