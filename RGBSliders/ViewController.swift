//
//  ViewController.swift
//  RGBSliders
//
//  Created by Вячеслав Горбатенко on 29.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: - IBOutlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var hexText: UITextField!
    
    @IBOutlet weak var hexButton: UIButton!
    
    
    // MARK: - Private Properties
    
    private var currentRed: CGFloat = 1
    private var currentGreen: CGFloat = 0.5
    private var currentBlue: CGFloat = 0

    
    // MARK: - viewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSlidersMaxMin()
        updateSliderLabels()
        updateColorView(
            red: currentRed,
            green: currentGreen,
            blue: currentBlue
        )
        updateHexButton()
    }
    
    // MARK: - IBActions
    
    @IBAction func sliderChanging(_ sender: UISlider) {
        switch sender {
        case redSlider:
            currentRed = CGFloat(redSlider.value)
        case greenSlider:
            currentGreen = CGFloat(greenSlider.value)
        case blueSlider:
            currentBlue = CGFloat(blueSlider.value)
        default:
            break
        }
        
        updateSliderLabels()
        updateColorView(
            red: currentRed,
            green: currentGreen,
            blue: currentBlue
        )
        updateHexButton()
    }
    
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            // red
            colorButtonAction(red: 1, green: 0.22, blue: 0.2)
        case 2:
            // green
            colorButtonAction(red: 0.2, green: 0.78, blue: 0.35)
        case 3:
            // blue
            colorButtonAction(red: 0, green: 0.5, blue: 1)
        case 4:
            // orange
            colorButtonAction(red: 1, green: 0.58, blue: 0)
        case 5:
            //mint
            colorButtonAction(red: 0.35, green: 0.77, blue: 0.74)
        case 6:
            // purple
            colorButtonAction(red: 0.64, green: 0.34, blue: 0.84)
        case 7:
            // yellow
            colorButtonAction(red: 0.96, green: 0.8, blue: 0)
        case 8:
            // indigo
            colorButtonAction(red: 0.31, green: 0.30, blue: 0.73)
        case 9:
            // cyan
            colorButtonAction(red: 0.35, green: 0.6, blue: 0.79)
        default:
            break
        }
    }
    
    @IBAction func randomColorButtonTapped() {
        colorButtonAction(
            red: Float.random(in: 0...1),
            green: Float.random(in: 0...1),
            blue: Float.random(in: 0...1)
        )
    }
    
// MARK: - Private Methods
    
    private func updateColorView(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.backgroundColor = UIColor.init(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.white.cgColor
    }
    
    private func updateSliderLabels() {
        redSliderLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setSliderValues(red: Float, green: Float, blue: Float) {
        redSlider.setValue(red, animated: true)
        greenSlider.setValue(green, animated: true)
        blueSlider.setValue(blue, animated: true)
    }
    
    private func colorButtonAction(red: Float, green: Float, blue: Float) {
        updateColorView(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue)
        )
        setSliderValues(red: red, green: green, blue: blue)
        updateSliderLabels()
        updateHexButton()
    }
    
    private func setSlidersMaxMin() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
    }
    
    private func updateHexButton() {
        hexButton.setTitle(
            colorView.backgroundColor?.toHexString(),
            for: .normal
        )
    }
}

extension UIColor {
        func toHexString() -> String {
            // взял со StackOverflow :)
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 1

            getRed(&r, green: &g, blue: &b, alpha: &a)

            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

            return String(format:"#%06x", rgb)
        }
    }
