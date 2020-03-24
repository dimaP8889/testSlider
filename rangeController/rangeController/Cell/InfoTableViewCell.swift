//
//  InfoTableViewCell.swift
//  rangeController
//
//  Created by Dmytro Pogrebniak on 24.03.2020.
//  Copyright © 2020 dima. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var upper: UILabel!
    @IBOutlet weak var lower: UILabel!
    
    func configureCell(number : Int,
                       upper: CGFloat,
                       lower: CGFloat) {
        
        self.number.text = "\(number)"
        self.upper.text = "Upper: \(upper)"
        self.lower.text = "Lower: \(lower)"
    }
}
