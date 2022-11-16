//
//  mainScreenViewController.swift
//  RGBSliders
//
//  Created by Вячеслав Горбатенко on 16.11.2022.
//

import UIKit

// MARK: - Delegates
protocol ColorViewControllerDelegate {
    func saveNewColors(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var currentRed: CGFloat = 1
    private var currentGreen: CGFloat = 0.5
    private var currentBlue: CGFloat = 0
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewBackgroundColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else { return }
        colorVC.currentRed = currentRed
        colorVC.currentGreen = currentGreen
        colorVC.currentBlue = currentBlue
        
        colorVC.delegate = self
    }
    
    // MARK: - Private Methods
    
    private func updateViewBackgroundColor() {
        view.backgroundColor = UIColor(
            red: currentRed,
            green: currentGreen,
            blue: currentBlue,
            alpha: 1)
    }
}

// MARK: - ColorViewControllerDelegate

extension MainScreenViewController: ColorViewControllerDelegate {
    func saveNewColors(red: CGFloat, green: CGFloat, blue: CGFloat) {
        currentRed = red
        currentGreen = green
        currentBlue = blue
        
        updateViewBackgroundColor()
    }
}
