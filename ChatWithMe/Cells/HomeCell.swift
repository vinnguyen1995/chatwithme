//
//  HomeCell.swift
//  ChatWithMe
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var lblPeopleName: UILabel?
    @IBOutlet weak var peopleAvatar: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblPeopleName?.numberOfLines = 0
        peopleAvatar?.layer.masksToBounds = false
        peopleAvatar?.clipsToBounds = true
        peopleAvatar?.layer.cornerRadius = 20
        peopleAvatar?.contentMode = .scaleAspectFill
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func binding(people: People) {
        peopleAvatar?.image = UIImage(named: people.avatar)
        lblPeopleName?.text = people.name
    }
}
