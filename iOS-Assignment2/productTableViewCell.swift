//
//  productTableViewCell.swift
//  iOS-Assignment2
//
//  Created by user239796 on 3/4/24.
//

import UIKit

class productTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
