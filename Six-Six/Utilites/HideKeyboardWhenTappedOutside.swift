//
//  HideKeyboardWhenTappedOutside.swift
//  Six-Six
//
//  Created by itay gervash on 07/11/2020.
//

import UIKit

extension UIViewController {
    
    
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
