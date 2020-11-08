//
//  SecondaryViewController.swift
//  Six-Six
//
//  Created by itay gervash on 07/11/2020.
//

import UIKit

class SecondaryViewController: ExtendedViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataTextField: CRTextField!
    @IBOutlet weak var dataButton: CRButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareUI(withLeftSwipeGR: true)
    }
    
    @IBAction func dataButtonPressed(_ sender: Any) {
        addDataToLabel()
    }
    
    private func addDataToLabel() {
        guard dataTextField.text != nil else { return }
        
        if let asInt = Int(dataTextField.text!) {
            let result = Int(pow(2, CGFloat(asInt)))
            let formatter = NumberFormatter(); formatter.numberStyle = .decimal
            self.dataLabel.text = formatter.string(from: NSNumber(value: result))
            self.dataLabel.textColor = .label
        } else {
            self.dataLabel.text = "Please provide an integer"
            self.dataLabel.textColor = .red
        }
        
    }
    
    internal override func prepareUI(withLeftSwipeGR: Bool) {
        super.prepareUI(withLeftSwipeGR: withLeftSwipeGR)
        
        self.title = "3B"
        
        dataButton.isEnabled = false
        dataButton.backgroundColor = .lightGray
        dataButton.tintColor = .darkGray
        
        dataTextField.addTarget(self, action: #selector(textFieldTextDidChange(textField:)), for: .editingChanged)

    }
    
    override func handleLeftSwipe(_ sender: UISwipeGestureRecognizer, triggerDistance: CGFloat, completion: () -> ()) {
        super.handleLeftSwipe(sender, triggerDistance: view.frame.width / 2) {
            self.performSegue(withIdentifier: "bToC", sender: self)
        }
    }
    
    @objc func textFieldTextDidChange(textField: UITextField) {
        if textField.text != "" && textField.text != nil {
            dataButton.isEnabled = true
            dataButton.backgroundColor = .systemPink
            dataButton.tintColor = .white
        } else {
            dataButton.isEnabled = false
            dataButton.backgroundColor = .lightGray
            dataButton.tintColor = .darkGray
        }
    }
    
}
