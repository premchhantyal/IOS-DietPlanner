//
//  TwoColTableViewCell.swift
//  DietPlanner
//
//  Created by user193216 on 12/12/21.
//

import UIKit

class TwoColTableViewCell: UITableViewCell {

    @IBOutlet weak var nutritionTitle: UILabel!
    @IBOutlet weak var nutritionAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
