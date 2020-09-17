//
//  TableViewCell.swift
//  YoutubeApi
//
//  Created by Yuan-Che Chang on 2020/9/6.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var coveImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var autherLabel: UILabel!
    
    @IBOutlet weak var viewLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
