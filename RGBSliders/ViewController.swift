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
    
    private var currentRed: CGFloat = 1
    private var currentGreen: CGFloat = 0.5
    private var currentBlue: CGFloat = 0

    
    // MARK: - viewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSlidersMaxMin()
        showSlidersLabels()
        showColorView(red: currentRed, green: currentGreen, blue: currentBlue)
    }
    
    // MARK: - Slider Actions
    @IBAction func redSliderChanging() {
        currentRed = CGFloat(redSlider.value)
        showSlidersLabels()
        showColorView(red: currentRed, green: currentGreen, blue: currentBlue)
        hexText.text = colorView.backgroundColor?.toHexString()

    }
    
    @IBAction func greenSliderChanging() {
        currentGreen = CGFloat(greenSlider.value)
        showSlidersLabels()
        showColorView(red: currentRed, green: currentGreen, blue: currentBlue)
        hexText.text = colorView.backgroundColor?.toHexString()

    }
    
    @IBAction func bueSliderChanging() {
        currentBlue = CGFloat(blueSlider.value)
        showSlidersLabels()
        showColorView(red: currentRed, green: currentGreen, blue: currentBlue)
        hexText.text = colorView.backgroundColor?.toHexString()

    }
    
    //MARK: - Button Actions
    @IBAction func setRedColorButton() {
        setButtonColor(red: 1, green: 0.22, blue: 0.2)
    }
    
    @IBAction func setGreenColorButton() {
        setButtonColor(red: 0.2, green: 0.78, blue: 0.35)
    }
    
    @IBAction func setBlueColorButton() {
        setButtonColor(red: 0, green: 0.5, blue: 1)
    }
    
    @IBAction func setOrangeColorButton() {
        setButtonColor(red: 1, green: 0.58, blue: 0)
    }
    
    @IBAction func setMintColorButton() {
        setButtonColor(red: 0.35, green: 0.77, blue: 0.74)
    }
    
    @IBAction func setPurpleColorButton() {
        setButtonColor(red: 0.64, green: 0.34, blue: 0.84)
    }
    
    @IBAction func setYellowColorButton() {
        setButtonColor(red: 0.96, green: 0.8, blue: 0)
    }
    
    @IBAction func setIndigoColorButton() {
        setButtonColor(red: 0.31, green: 0.30, blue: 0.73)
    }
    
    @IBAction func setCyanColorButton() {
        setButtonColor(red: 0.35, green: 0.6, blue: 0.79)
    }
    
    @IBAction func setRandonColorButton() {
        setButtonColor(red: Float.random(in: 0...1), green: Float.random(in: 0...1), blue: Float.random(in: 0...1))
    }
    
// MARK: - Private Methods
    
    private func showColorView(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.white.cgColor
    }
    
    private func showSlidersLabels() {
        redSliderLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setSlidersValues(red: Float, green: Float, blue: Float) {
        redSlider.setValue(red, animated: true)
        greenSlider.setValue(green, animated: true)
        blueSlider.setValue(blue, animated: true)
    }
    
    private func setButtonColor(red: Float, green: Float, blue: Float) {
        showColorView(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
        setSlidersValues(red: red, green: green, blue: blue)
        showSlidersLabels()
        hexText.text = colorView.backgroundColor?.toHexString()
    }
    
    // словил баг, когда минимальное значение красного слайдера было 0.5, хотя в настройках стоял 0. Пришлось прописать в коде – только тогда заработало
    private func setSlidersMaxMin() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
    }
}

extension UIColor {
        func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 1

            getRed(&r, green: &g, blue: &b, alpha: &a)

            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

            return String(format:"#%06x", rgb)
        }
    }
