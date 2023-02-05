//
//  ViewController.swift
//  11_BMI Calculator
//
//  Created by pvl kzntsv on 05.02.2023.
//

import UIKit

class CalculateViewController: UIViewController {
    var calculatorBrain = CalculatorBrain()
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = height
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = weight
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

