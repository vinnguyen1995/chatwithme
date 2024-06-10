//
//  SenderCell.swift
//  ChatWithMe
//
//  Created by Long Nguyen on 10/6/24.
//

import UIKit

class SenderCell: UICollectionViewCell {
    
    @IBOutlet weak var messageSender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageSender.text = "Helloooooo!"
    }
    
    func binding(message: Message) {
        messageSender.text = message.content
    }

}
