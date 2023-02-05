//
//  CalculatorBrain.swift
//  11_BMI Calculator
//
//  Created by pvl kzntsv on 05.02.2023.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBmiValue() -> String {
        let decimalBmi = String(format: "%.1f", bmi?.value   ?? 0.0)
        return decimalBmi
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        switch bmiValue {
        case ..<18.5: bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.cyan)
        case ...24.9: bmi = BMI(value: bmiValue, advice: "You're good", color: UIColor.green)
        default:
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red )
        }
    }
}
 
