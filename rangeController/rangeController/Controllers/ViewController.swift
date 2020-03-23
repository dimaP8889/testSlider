//
//  ViewController.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 23.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rangeSlider = RangeSlider(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rangeSlider)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20
        let width = view.bounds.width - 2 * margin
        let height: CGFloat = 30
        
        rangeSlider.frame = CGRect(x: 0, y: 0,
                                   width: width, height: height)
        rangeSlider.center = view.center
        
    }
}
