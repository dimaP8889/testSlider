//
//  ValueController.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import UIKit

final class ValueController : Equatable {
    
    weak var delegate : ValueChangedDelegate?
    
    var minimumValue: CGFloat
    var maximumValue: CGFloat
    
    var lowerValue: CGFloat {
        didSet { delegate?.didChangeValue() }
    }
    var upperValue: CGFloat{
        didSet { delegate?.didChangeValue() }
    }
    
    var step : Int
    
    init(minimumValue: CGFloat = 0,
         maximumValue: CGFloat = 1,
         lowerValue: CGFloat = 0,
         upperValue: CGFloat = 1,
         step: Int = 1) {
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.lowerValue = lowerValue
        self.upperValue = upperValue
        self.step = step
    }
    
    static func == (lhs: ValueController, rhs: ValueController) -> Bool {
        lhs.lowerValue == rhs.lowerValue && lhs.upperValue == rhs.upperValue
    }
}

extension ValueController : Copying {
    
    convenience init(_ prototype: ValueController) {
        
        self.init(minimumValue: prototype.minimumValue,
                  maximumValue: prototype.maximumValue,
                  lowerValue: prototype.lowerValue,
                  upperValue: prototype.upperValue,
                  step: prototype.step)
    }
}
