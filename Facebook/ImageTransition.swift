//
//  ImageTransition.swift
//  Facebook
//
//  Created by Michelle Harvey on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
