//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var fruitPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var selectedNum: Int?
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
    }
    
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        let generateNum1 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let generateNum2 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let generateNum3 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        
        
        fruitPicker.selectRow(generateNum1, inComponent:0, animated:true)
        
        fruitPicker.selectRow(generateNum2, inComponent:1, animated: true)
        
        fruitPicker.selectRow(generateNum3, inComponent:2, animated: true)
        if generateNum1 == generateNum2 && generateNum2 == generateNum3 {
            self.resultLabel.hidden = false
            self.resultLabel.text = "WINNER!"
        } else {
            self.resultLabel.hidden = false
            self.resultLabel.text = "TRY AGAIN"
        }
        //self.resultLabel.hidden = true
//        self.resultLabel.text = fruitsArray[generateNum]
//        self.selectedNum = generateNum
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

extension ViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    
//    func pickerView(pickerView: UIPickerView!, widthForComponent component: Int) -> CGFloat {
//        return 140.60
//    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return fruitsArray[row]
    }
    
//    func pickerView(pickerView: UIPickerView!, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView! {
//        
//    }
    
}



