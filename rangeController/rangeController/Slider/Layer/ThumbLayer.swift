//
//  ThumbLayer.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 23.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import Foundation
import UIKit

class ThumbLayer : CAGradientLayer {
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
    override init() {
        
        super.init()
        cornerRadius = 15.5
        shadowColor = #colorLiteral(red: 0.27, green: 0.31, blue: 0.33, alpha: 0.2)
        shadowOffset = CGSize(width: 0, height: 3)
        shadowOpacity = 1
        colors = [UIColor.white.cgColor, UIColor(red: 0.95, green: 0.97, blue: 0.98, alpha: 1).cgColor]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
