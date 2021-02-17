//
//  RestaurantTableViewCell.swift
//  FoodPin-2
//
//  Created by Prakhar Kumar on 15/02/21.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tintColor = .systemYellow;
    }
    
    @IBOutlet var nameLabel: UILabel!;
    @IBOutlet var typeLabel: UILabel!;
    @IBOutlet var locationLabel: UILabel!;
    @IBOutlet var thumbnailImage: UIImageView! {
        didSet {
            thumbnailImage.layer.cornerRadius = 20.0;
            thumbnailImage.clipsToBounds = true;
        }
    };

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
