//
//  CustomTableViewCell.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var myCustomLabel: UILabel!
    @IBOutlet weak var myCustomImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
