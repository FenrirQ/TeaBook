//
//  TutorialVC.swift
//  TeaBook
//
//  Created by Quang Ly Hoang on 6/6/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController, UIScrollViewDelegate {

    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        pageControl.numberOfPages = Int(scrollView.contentSize.width / scrollView.bounds.width)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int((scrollView.contentOffset.x + scrollView.bounds.width / 2) / scrollView.bounds.width)
        
        if pageControl.currentPage == 3 {
            nextButton.setTitle("Bỏ qua", for: .normal)
        } else {
            nextButton.setTitle("Tiếp tục", for: .normal)
        }
    
    }
    
    @IBAction func nextOrPass(_ sender: UIButton) {
        if sender.titleLabel?.text == "Tiếp tục" {
            let slideToX = scrollView.contentOffset.x + scrollView.bounds.width
            
            scrollView.scrollRectToVisible(CGRect(x: slideToX, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height), animated: true)
            
        } else {
            performSegue(withIdentifier: "toTabbar", sender: sender)
        }
    }
    
}


extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
