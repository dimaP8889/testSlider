//
//  ValuesValidator.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import Foundation

final class ValuesValidator {
    
    var oldCopy : [ValueController]
    var current : [ValueController]
    
    func validate() -> Bool {

        oldCopy == current
    }
    
    init(values: [ValueController]) {
        
        current = values
        oldCopy = values.map { ValueController.init($0) }
    }
}
