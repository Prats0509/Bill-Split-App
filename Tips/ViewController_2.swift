//
//  ViewController_2.swift
//  Tips
//
//  Created by Pratiksha on 2024-11-05.
//

import UIKit

class ViewController_2: UIViewController {
    
    @IBOutlet weak var results: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    var value : Double = 0.0
    var people : Double = 0.0
    var percentage : Double = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        results.text = String(format: "%.2f", value)
        let splitResult = "Split between \(Int(people)), with \(String(format: "%.2f", percentage * 100))% tip "
        label2.text = splitResult
       
    }
    
    

    
}
