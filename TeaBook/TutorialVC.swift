//
//  TutorialVC.swift
//  TeaBook
//
//  Created by Quang Ly Hoang on 6/6/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pageControl.numberOfPages = Int(scrollView.contentSize.width / scrollView.bounds.width)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func nextOrPass(_ sender: UIButton) {
        if sender.titleLabel?.text == "Tiếp tục" {
            let slideToX = scrollView.contentOffset.x + scrollView.bounds.width
            
            scrollView.scrollRectToVisible(CGRect(x: slideToX, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height), animated: true)
            
        } else {
            performSegue(withIdentifier: "toTabbar", sender: sender)
            UserDefaults.standard.set(true, forKey: "isPresentTutorial")
        }
    }
  
}

// MARK: - UIScrollViewDelegate
extension TutorialVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print(scrollView.contentOffset.x)
    pageControl.currentPage = Int((scrollView.contentOffset.x + scrollView.bounds.width / 2) / scrollView.bounds.width)
    
    if pageControl.currentPage == 3 {
      nextButton.setTitle("Bỏ qua", for: .normal)
    } else {
      nextButton.setTitle("Tiếp tục", for: .normal)
    }
  }
}
