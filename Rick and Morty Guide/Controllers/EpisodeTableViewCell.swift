//
//  EpisodeTableViewCell.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/3/21.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
  
  @IBOutlet weak var episodeImage: UIImageView!
  @IBOutlet weak var episodeLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
