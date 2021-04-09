//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selector: UIPickerView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var moneyText: UILabel!
    
    let coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selector.delegate = self
        selector.dataSource = self
        
        
    }
    


}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    
}
