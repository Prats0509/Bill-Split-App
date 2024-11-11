import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var peopleCountLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var billTextField: UITextField!
    
    var tipPercent: Double = 0.0
    var totalEach: Double = 0.0
    var billAmount: Double = 0.0
    var selectedTip: Double = 0.0
    var activeButton: UIButton?
    var totalAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleStepper.value = 2
        peopleCountLabel.text = "\(Int(peopleStepper.value))"
        peopleStepper.minimumValue = 1
        peopleStepper.maximumValue = 10
        peopleStepper.stepValue = 1
    }
    
    @IBAction func billAmountChanged(_ sender: UITextField) {
        if let text = sender.text, let amount = Double(text) {
            billAmount = amount
        } else {
            billAmount = 0.0
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        peopleCountLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func tipButtonTapped(_ sender: UIButton) {
        let darkGreen = UIColor(red: 105/255, green: 172/255, blue: 119/255, alpha: 1.0)
        let lightGreen = UIColor(red: 227/255, green: 247/255, blue: 236/255, alpha: 1.0)
        let tips = [0.0, 0.1, 0.2]
        
        if let previousButton = activeButton {
            previousButton.backgroundColor = lightGreen
            previousButton.setTitleColor(UIColor.red, for: .normal)
            previousButton.setNeedsDisplay()
        }
        
        selectedTip = tips[sender.tag]
        sender.backgroundColor = UIColor.white
        activeButton = sender
    }
    
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        if let amountText = billTextField.text, let amount = Double(amountText) {
            billAmount = amount
        } else {
            return
        }
        
        let peopleCount = Int(peopleStepper.value)
        let tipValue = billAmount * selectedTip
        totalAmount = billAmount + Double(tipValue)
        totalEach = totalAmount / Double(peopleCount)
        
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            if let destination = segue.destination as? ViewController_2 {
                destination.value = totalEach
                destination.people = peopleStepper.value
                destination.percentage = selectedTip
            }
        }
    }
}
