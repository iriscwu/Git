//
//  DataCell.swift
//  Timmer
//
//  Created by Iris.Wu on 2018/3/12.
//  Copyright © 2018年 calvin.chang. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet fileprivate weak var timeLabel: UILabel!
    @IBOutlet fileprivate weak var indexLabel: UILabel!
    
    
    internal var timeCell = "" {
        didSet {
            timeLabel?.text = timeCell
        }
    }
    
    internal var indexCell = 1 {
        didSet {
            indexLabel?.text = "\(indexCell)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
