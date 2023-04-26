//
//  ProductDetailsTableViewCell.swift
//  EcommerceUI
//
//  Created by Minal Wani on 26/04/23.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
