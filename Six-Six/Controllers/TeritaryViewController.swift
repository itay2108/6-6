//
//  TeritaryViewController.swift
//  Six-Six
//
//  Created by itay gervash on 08/11/2020.
//

import UIKit

class TeritaryViewController: ExtendedViewController {
    
    @IBOutlet var fields: [CRTextField]!

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var firstNumTextField: CRTextField!
    @IBOutlet weak var operatorSegment: UISegmentedControl!
    @IBOutlet weak var secondNumTextField: CRTextField!
    @IBOutlet weak var calculateButton: CRButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareUI(withLeftSwipeGR: false)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: CRButton!) {
        updateLabel()
    }
    
    private func calculate() -> Int? {
        
        guard
            firstNumTextField.text != nil,
            firstNumTextField.text != "",
            secondNumTextField.text != nil,
            secondNumTextField.text != ""
        else { return nil }
        
        if let _operator: Operators = Operators(rawValue: operatorSegment.selectedSegmentIndex), let a = Int(firstNumTextField.text!), let b = Int(secondNumTextField.text!) {
            switch _operator {
            case .add:
                return a + b
            case .substract:
                return a - b
            case .multiply:
                return a * b
            case .divide:
                return a / b
            }
        } else { return nil }
              
        
    }
    
    private func updateLabel() {
        if let result = calculate() {
            let formatter = NumberFormatter(); formatter.numberStyle = .decimal
            dataLabel.text = formatter.string(from: NSNumber(value: result))
            dataLabel.textColor = .label
        } else {
            dataLabel.text = "error performing calculation, please make sure both values are of type integer"
            dataLabel.textColor = .red
        }
    }
    
    internal override func prepareUI(withLeftSwipeGR: Bool) {
        super.prepareUI(withLeftSwipeGR: withLeftSwipeGR)
        
        self.title = "3C"
        
        calculateButton.isEnabled = false
        calculateButton.backgroundColor = .lightGray
        calculateButton.tintColor = .darkGray
        
        firstNumTextField.addTarget(self, action: #selector(textFieldTextDidChange(textField:)), for: .editingChanged)
        secondNumTextField.addTarget(self, action: #selector(textFieldTextDidChange(textField:)), for: .editingChanged)

    }
    
    @objc func textFieldTextDidChange(textField: UITextField) {
        
        for textfield in fields {
            if textfield.text == "" || textfield.text == nil {
                calculateButton.isEnabled = false
                calculateButton.backgroundColor = .lightGray
                calculateButton.tintColor = .darkGray
                break
            } else {
                calculateButton.isEnabled = true
                calculateButton.backgroundColor = .systemTeal
                calculateButton.tintColor = .white
            }
        }
        
    
    }

}
