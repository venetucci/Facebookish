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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActionsView: UIImageView!
    
    let backgroundViewColor = UIColor(white: 0, alpha: 1)
    var imageViews = [UIImageView]()
    var currentImageViewIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.backgroundColor = backgroundViewColor
        
        for imageIndex in 0...4 {
            let imageView = UIImageView(image: UIImage(named: "wedding\(imageIndex + 1)"))
            imageView.frame = buildImageFrame(imageView, imageIndex: imageIndex)
            
            imageViews.append(imageView)
            scrollView.addSubview(imageView)
        }
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1600, height: 1000)
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
        return imageViews[currentImageViewIndex]
    }
    
    func buildImageFrame(imageView: UIImageView, imageIndex: Int) -> CGRect {
        let endWidth = CGFloat(320)
        let endHeight = (imageView.frame.height / imageView.frame.width) * endWidth
        let endCenterY = (scrollView.frame.height - endHeight) / CGFloat(2)
        
        return CGRect(x: CGFloat(imageIndex * 320), y: endCenterY, width: endWidth, height: endHeight)
    }
    
    // MARK: Actions
    @IBAction func didPressDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
