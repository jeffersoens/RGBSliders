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
    
    private var currentRed: CGFloat = 1
    private var currentGreen: CGFloat = 0.5
    private var currentBlue: CGFloat = 0
    
    // MARK: - viewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSlidersLabels()
        showColorView()
    }

    // MARK: - IBActions
    
 
    @IBAction func redSliderChanging() {
        currentRed = CGFloat(redSlider.value)
        showSlidersLabels()
        showColorView()
    }
    
    
    @IBAction func greenSliderChanging() {
        currentGreen = CGFloat(greenSlider.value)
        showSlidersLabels()
        showColorView()
    }
    
    
    @IBAction func bueSliderChanging() {
        currentBlue = CGFloat(blueSlider.value)
        showSlidersLabels()
        showColorView()
    }
    
// MARK: - Private Methods
    
    private func showColorView() {
        colorView.backgroundColor = UIColor.init(red: currentRed, green: currentGreen, blue: currentBlue, alpha: 1)
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.white.cgColor
    }
    
    private func showSlidersLabels() {
        redSliderLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderLabel.text = String(format: "%.2f", blueSlider.value)
    }
}

