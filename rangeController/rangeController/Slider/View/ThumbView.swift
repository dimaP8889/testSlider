//
//  ThumbView.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 23.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import Foundation
import UIKit

class ThumbView : UIView {
    
    override class var layerClass: AnyClass {
        
        return ThumbLayer.self
    }
    
    override var layer: CALayer {
        return ThumbLayer()
    }
    
    var isHighlighted : Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
