//
//  ExtendedViewController.swift
//  Six-Six
//
//  Created by itay gervash on 07/11/2020.
//

import UIKit
import SnapKit

class ExtendedViewController: UIViewController {
    
    var labelContent: String = ""

    lazy var leftSwipeGR: UISwipeGestureRecognizer = {
        let gr = UISwipeGestureRecognizer()
        gr.direction = .left
        gr.addTarget(self, action: #selector(handleLeftSwipe(_:triggerDistance:completion:)))
        return gr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func handleLeftSwipe(_ sender: UISwipeGestureRecognizer, triggerDistance: CGFloat, completion:() -> ()) {
        
        var startPoint = CGPoint()
        
        if sender.state == .began {
            startPoint = sender.location(in: self.view)
        }
        
        let distance = startPoint.x - sender.location(in: self.view).x

        if sender.state == .ended || distance > triggerDistance {
            completion()
        }
        
    }
    
    func prepareUI(withLeftSwipeGR includeleftSwipeGR: Bool) {
        self.hideKeyboardWhenTappedAround()
        
        
        if includeleftSwipeGR {
            self.view.addGestureRecognizer(leftSwipeGR)
        }
        
    }
    
    var safeAreaTop: ConstraintItem {
        get {
            return self.view.safeAreaLayoutGuide.snp.top
        }
    }
    
    var safeAreaBottom: ConstraintItem {
        get {
            return self.view.safeAreaLayoutGuide.snp.bottom
        }
    }

}
