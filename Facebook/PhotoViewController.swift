//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Michelle Harvey on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActionsView: UIImageView!
    
    var image: UIImage!
    var backgroundViewColor = UIColor(white: 0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        
        backgroundView.backgroundColor = backgroundViewColor
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        
    }
    
    
    // MARK: UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetFade = 1 - (scrollView.contentOffset.y / -60)
        
        doneButton.alpha = offsetFade
        backgroundView.alpha = offsetFade
        photoActionsView.alpha = offsetFade
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    // MARK: Actions
    @IBAction func didPressDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
