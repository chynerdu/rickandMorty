//
//  EpisodesTableViewCell.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 29/11/2023.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    var task = Task {}
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
//        starImageView.image = UIImage(systemName: "person")
        task.cancel()
    }

}
