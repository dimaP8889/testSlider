//
//  RangeSlider.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 23.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import Foundation
import UIKit

class RangeSlider: UIControl {
    
    //MARK: Instance Variables
    
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 30
    var lowerValue: CGFloat = 4
    var upperValue: CGFloat = 21
    
    private let thumbImage = #imageLiteral(resourceName: "Oval")
    private var thumbImageSize = CGSize(width: 31, height: 31)
    
    var margin : CGFloat = 30
    private var trackSize : CGSize = CGSize()
    
    private let trackLayer = CALayer()
    
    private var lowerThumbLayer = ThumbView()
    private var upperThumbLayer = ThumbView()
    
    lazy var lowerThumbLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        label.textColor = UIColor(red: 0, green: 0.643, blue: 1, alpha: 1)
        return label
    }()
    
    lazy var upperThumbLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        label.textColor = UIColor(red: 0, green: 0.643, blue: 1, alpha: 1)
        return label
    }()
    
    private var previousLocation = CGPoint()
    
    override var frame: CGRect {
        didSet {
            trackSize = CGSize(width: bounds.width - 2 * margin, height: 3)
            updateFrames()
        }
    }
    
    //MARK: View Lifecycle
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        trackLayer.backgroundColor = #colorLiteral(red: 0, green: 0.64, blue: 1, alpha: 1)
        layer.addSublayer(trackLayer)
        
        addSubview(upperThumbLayer)
        addSubview(lowerThumbLayer)
        
        addSubview(lowerThumbLabel)
        addSubview(upperThumbLabel)
        
        setLabelsText()
        updateFrames()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Handle UI
    private func setLabelsText() {
        
        lowerThumbLabel.text = "\(Int(lowerValue)) ночей"
        upperThumbLabel.text = "\(Int(upperValue)) ночей"
        
        upperThumbLabel.sizeToFit()
        lowerThumbLabel.sizeToFit()
    }
    
    //MARK: Handle Frames
    private func updateFrames() {
        
        trackLayer.frame = CGRect(origin: CGPoint(x: margin,
                                                  y: (bounds.size.height - trackSize.height) / 2),
                                  size: trackSize)
        trackLayer.setNeedsDisplay()
        
        lowerThumbLayer.frame = CGRect(origin: thumbOriginForValue(lowerValue),
                                           size: thumbImageSize)
        upperThumbLayer.frame = CGRect(origin: thumbOriginForValue(upperValue),
                                           size: thumbImageSize)
        
        upperThumbLabel.center.x = upperThumbLayer.center.x
        lowerThumbLabel.center.x = lowerThumbLayer.center.x
        
        upperThumbLabel.center.y = upperThumbLayer.center.y - 35
        lowerThumbLabel.center.y = lowerThumbLayer.center.y - 35
        
        checkDistances()
        
    }
    
    private func checkDistances() {
         
         let differ = lowerThumbLabel.frame.maxX - upperThumbLabel.frame.minX
         
         if differ > 0 {
             
             lowerThumbLabel.center.x -= differ / 2
             upperThumbLabel.center.x += differ / 2
         }
     }
    
    
    func positionForValue(_ value: CGFloat) -> CGFloat {
        return value / (maximumValue - minimumValue) * trackSize.width
    }
    
    private func thumbOriginForValue(_ value: CGFloat) -> CGPoint {
        let x = positionForValue(value) - thumbImageSize.width / 2 + margin
        return CGPoint(x: x, y: (bounds.height - thumbImageSize.height) / 2.0)
    }
}

// MARK: Extensions

// MARK: Touch Events

extension RangeSlider {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        previousLocation = touch.location(in: self)
        
        if lowerThumbLayer.frame.contains(previousLocation) {
            lowerThumbLayer.isHighlighted = true
        } else if upperThumbLayer.frame.contains(previousLocation) {
            upperThumbLayer.isHighlighted = true
        }
        
        
        return lowerThumbLayer.isHighlighted || upperThumbLayer.isHighlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let location = touch.location(in: self)
        
        let deltaLocation = location.x - previousLocation.x
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / trackSize.width
        
        previousLocation = location
        
        if lowerThumbLayer.isHighlighted {
            lowerValue += deltaValue
            lowerValue = boundValue(lowerValue, toLowerValue: minimumValue,
                                    upperValue: upperValue)
            
        } else if upperThumbLayer.isHighlighted {
            upperValue += deltaValue
            
            upperValue = boundValue(upperValue, toLowerValue: lowerValue,
                                    upperValue: maximumValue)
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        updateFrames()
        setLabelsText()
        
        CATransaction.commit()
        
        return true
    }
    
    
    private func boundValue(_ value: CGFloat, toLowerValue lowerValue: CGFloat,
                            upperValue: CGFloat) -> CGFloat {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbLayer.isHighlighted = false
        upperThumbLayer.isHighlighted = false
    }
}
