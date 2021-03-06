//
//  FilterCell.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import Foundation
import UIKit

class FilterCell : UITableViewCell {
    
    weak var delegate : ValueChangedDelegate?
    
    var model : ValueController?
    
    let rangeSlider = RangeSlider(frame: .zero)
    
    override var frame: CGRect {
        
        didSet { setupFrame() }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        addSubview(rangeSlider)
    }
    
    private func setupFrame() {
        
        rangeSlider.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
    func setupRange(values: ValueController) {
        
        model = values
        
        rangeSlider.setValues(values: values)
    }
}

