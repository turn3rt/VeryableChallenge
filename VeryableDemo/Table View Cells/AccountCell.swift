//
//  AccountCell.swift
//  VeryableDemo
//
//  Created by Turner Thornberry on 5/1/20.
//  Copyright © 2020 Turner Thornberry. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var accType: UILabel!
    @IBOutlet weak var accName: UILabel!
    @IBOutlet weak var desc: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
