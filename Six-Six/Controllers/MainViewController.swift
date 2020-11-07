import UIKit
import SnapKit

class MainViewController: ExtendedViewController {
    
    let def = UserDefaults.standard

    @IBOutlet weak var guide: UIView!
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataTextField: CRTextField!
    @IBOutlet weak var dataButton: CRButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareUI(withLeftSwipeGR: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if def.bool(forKey: "guideShown") {
            guide.isHidden = true
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        def.set(true, forKey: "guideShown")
    }
    

    @IBAction func dataButtonPressed(_ sender: UIButton) {
        addDataToLabel()
        dataTextField.text = ""
    }
    
    private func addDataToLabel() {
        guard dataTextField.text != nil else { return }
        
        labelContent = dataTextField.text! + " " + labelContent
        
        dataLabel.text = labelContent
    }
    
    internal override func prepareUI(withLeftSwipeGR: Bool) {
        super.prepareUI(withLeftSwipeGR: withLeftSwipeGR)
        
        self.title = "3A"
        
        dataButton.isEnabled = false
        dataButton.backgroundColor = .lightGray
        dataButton.tintColor = .white
        
        dataTextField.addTarget(self, action: #selector(textFieldTextDidChange(textField:)), for: .editingChanged)
    
    }
    
    override func handleLeftSwipe(_ sender: UISwipeGestureRecognizer, triggerDistance: CGFloat, completion: () -> ()) {
        super.handleLeftSwipe(sender, triggerDistance: view.frame.width / 2) {
            self.performSegue(withIdentifier: "aToB", sender: self)
        }
    }
    
    @objc func textFieldTextDidChange(textField: UITextField) {
        if textField.text != "" && textField.text != nil {
            dataButton.isEnabled = true
            dataButton.backgroundColor = .systemPurple
            dataButton.tintColor = .white
            
        } else {
            dataButton.isEnabled = false
            dataButton.backgroundColor = .lightGray
            dataButton.tintColor = .darkGray
        }
    }
    
}
