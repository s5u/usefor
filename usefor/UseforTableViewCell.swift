//
//  UseforTableViewCell.swift
//  usefor
//
//  Created by 清水 佑樹 on 2016/01/11.
//  Copyright © 2016年 yuki shimizu. All rights reserved.
//

import UIKit

class UseforTableViewCell: UITableViewCell {
    @IBOutlet weak var priceField: UILabel!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var useforField: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
