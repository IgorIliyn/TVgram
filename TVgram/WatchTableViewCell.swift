//
//  WatchTableViewCell.swift
//  TVgram
//
//  Created by Igor Ilyin on 2/1/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class WatchTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func reuseIdentifier()->NSString{
//        return "Cell"
//    }
}
