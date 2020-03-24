//
//  ViewController.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 23.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model : [ValueController] = []
    
    override func viewDidLoad() {
        
        model.append(ValueController(minimumValue: 1,
                                     maximumValue: 31,
                                     lowerValue: 1,
                                     upperValue: 31,
                                     step: 1))
        model.append(ValueController(minimumValue: 1,
                                     maximumValue: 31,
                                     lowerValue: 1,
                                     upperValue: 31,
                                     step: 2))
        model.append(ValueController(minimumValue: 1,
                                     maximumValue: 31,
                                     lowerValue: 1,
                                     upperValue: 31,
                                     step: 1))
        model.append(ValueController(minimumValue: 1,
                                     maximumValue: 31,
                                     lowerValue: 18,
                                     upperValue: 20,
                                     step: 1))
        model.append(ValueController(minimumValue: 1,
                                     maximumValue: 31,
                                     lowerValue: 7,
                                     upperValue: 14,
                                     step: 1))
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dest = segue.destination as? FilterTableViewController else { return }
        
        dest.delegate = self
        dest.model = model.map { ValueController($0) }
    }
}

extension ViewController : FilterDataDelegate {
    
    func didSet(data: [ValueController]) {
        self.model = data
    }
}
