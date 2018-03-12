//
//  TableViewCell.swift
//  Timmer
//
//  Created by Iris.Wu on 2018/3/12.
//  Copyright © 2018年 calvin.chang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setNeedsLayout() {
        self.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
       
    }

}
