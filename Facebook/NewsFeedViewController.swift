//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
//    var imageTransition: ImageTransition!
    var fadeTransition: FadeTransition!
    var selectedImageView: UIImageView!
    var endTransition: CGRect!
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageTransition = ImageTransition()
//        imageTransition.duration = 5

        fadeTransition = FadeTransition()
//        fadeTransition.duration = 1
        
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let transitionImage = UIImageView(image: selectedImageView.image)
        
        let window = UIApplication.sharedApplication().keyWindow
        let frame = window!.convertRect(selectedImageView.frame, fromView: scrollView)
        print(frame)
        transitionImage.frame = frame

        view.addSubview(transitionImage)
        transitionImage.center.y = selectedImageView.center.y + 110
        
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
//        destinationViewController.transitioningDelegate = imageTransition
//        imageTransition.duration = 5
        destinationViewController.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.5
        
        var identifier = segue.identifier
        
    }
    
    @IBAction func onPhotoTap(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        selectedImageView = imageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
}
