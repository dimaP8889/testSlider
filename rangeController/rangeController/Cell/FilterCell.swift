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
    
    let rangeSlider = RangeSlider(frame: .zero)
    
    override var frame: CGRect {
        
        didSet { setupConstraints() }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        addSubview(rangeSlider)
    }
    
    func setupConstraints() {
        
        rangeSlider.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
