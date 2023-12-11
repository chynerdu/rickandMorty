//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 30/11/2023.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    var task = Task {}
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        performSegue(withIdentifier: "characterdetails", sender: self)
        // Configure the view for the selected state
    }
    
    
    
    override func prepareForReuse() {
//        starImageView.image = UIImage(systemName: "person")
        task.cancel()
    }


}
