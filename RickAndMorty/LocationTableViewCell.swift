//
//  LocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 30/11/2023.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    var task = Task {}
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
