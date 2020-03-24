//
//  RoundedShadowButton.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedShadowButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButton()
    }
    
    
    private func setButton() {
        
        backgroundColor = .clear
        
        setTitleColor(.white, for: .normal)
        
        layer.backgroundColor = UIColor(red: 0, green: 0.643, blue: 1, alpha: 1).cgColor
        layer.cornerRadius = 5
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor(red: 0, green: 0.643, blue: 1, alpha: 0.45).cgColor

        let attributedText = NSMutableAttributedString(string: (titleLabel?.text)!,
                                                       attributes: [NSAttributedString.Key.kern: 0.85,
                                                                    NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                    NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 17)!])
        setAttributedTitle(attributedText, for: .normal)
    }
}
