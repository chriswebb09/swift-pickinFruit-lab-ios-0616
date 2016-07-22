//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var fruitPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]

    let numberOfComponents = 3
    let numberOfRows = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        self.resultLabel.alpha = 0
        
        self.fruitPicker.delegate = self;
        self.fruitPicker.dataSource = self;
        
        for i in 0..<self.numberOfComponents {
            self.fruitPicker.selectRow(numberOfRows/2, inComponent: i, animated: true)
        }
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return self.numberOfComponents
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.numberOfRows
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        pickSomeFruit()
        
    }
    
    func pickSomeFruit() {
        
        
        self.spinButton.userInteractionEnabled = false
        
        for i in 0..<self.numberOfComponents {
            
            let randomNumber = Int(arc4random_uniform(UInt32(numberOfRows)))
            self.fruitPicker.selectRow(randomNumber, inComponent: i, animated: true)
            
        }
        
        var results: [String: Bool] = [:]
        var resultText: String
        
        for i in 0..<self.numberOfComponents {
            
            let row = self.fruitPicker.selectedRowInComponent(i) % self.fruitsArray.count
            results[self.fruitsArray[row]] = true
            
        }
        
        if results.count == 1 {
            resultText = "WINNER!"
        } else {
            resultText = "TRY AGAIN"
        }
        
        animateResultsLabelWith(resultText)
        
    }

}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}

// MARK: Animations
extension ViewController {
    
    func animateResultsLabelWith(text: String) {
        
        self.resultLabel.text = text
        
        UIView.animateWithDuration(0.2, delay: 0.3, options: .CurveEaseIn, animations: {
            
            self.resultLabel.alpha = 1
            
        }) { _ in
            
            UIView.animateWithDuration(0.25, delay: 0, options: [.Autoreverse, .Repeat], animations: {
                UIView.setAnimationRepeatCount(2.5)
                
                self.resultLabel.alpha = 0
                
                }, completion: { _ in
                    
                    self.spinButton.userInteractionEnabled = true
            })
            
        }
    }
    
}



