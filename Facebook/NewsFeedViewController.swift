//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    var selectedImageView: UIImageView!
    var endTransition: CGRect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTransition = ImageTransition()

        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        destinationViewController.image = selectedImageView.image
        
        configureImageTransition(imageTransition)
        
        destinationViewController.transitioningDelegate = imageTransition
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
    }
    
    private func configureImageTransition(imageTransition: ImageTransition) {
        let window = UIApplication.sharedApplication().keyWindow!
        let initialImageFrame = window.convertRect(selectedImageView.frame, fromView: scrollView)
        
        imageTransition.duration = 0.5
        imageTransition.selectedImageView = selectedImageView
        imageTransition.initialImageFrame = initialImageFrame
    }
    
    // MARK: - Actions
    
    @IBAction func onPhotoTap(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        selectedImageView = imageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
}
