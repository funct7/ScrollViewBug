//
//  ViewController.swift
//  ScrollViewBug
//
//  Created by Josh Woomin Park on 2023/01/11.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var xValueLabel: UILabel!
    
    @IBOutlet weak var contentInsetScrollView: UIScrollView!
    
    @IBOutlet weak var offsetPaddingScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentInsetScrollView.contentInset.left = .itemSize
        // Try commenting out this line, and see how the behavior changes
        contentInsetScrollView.contentInset.right = .itemSize
    }
    
    @IBAction func scrollAction(_ sender: UIButton) {
        let x = CGFloat(Int(sender.title(for: .normal)!)!) * .itemSize
        xValueLabel.text = "\(x)"
        
        [contentInsetScrollView, offsetPaddingScrollView].forEach {
            $0.scrollRectToVisible(
                CGRect(x: x, y: 0, width: .itemSize, height: .itemSize),
                animated: true)
        }
    }
    
}

private extension CGFloat {
    static let itemSize: Self = 50
}
