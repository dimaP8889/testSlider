//
//  FilterDataDelegate.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import Foundation

protocol FilterDataDelegate : class {
    
    func didSet(data : [ValueController])
}
