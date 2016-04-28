//
//  LeaderCell.swift
//  SmashingTV
//
//  Created by Timothy Barrett on 4/27/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import UIKit

class LeaderCell: UITableViewCell {
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    static let reuseID:String = "LeaderCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        setSelected(false, animated: true)
        // Configure the view for the selected state
    }

}
