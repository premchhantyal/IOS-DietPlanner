//
//  ImageTableViewCell.swift
//  DietPlanner
//
//  Created by user193216 on 12/11/21.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var cuisineName: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
