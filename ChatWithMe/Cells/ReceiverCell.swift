//
//  ReceiverCell.swift
//  ChatWithMe
//
//  Created by Long Nguyen on 10/6/24.
//

import UIKit

class ReceiverCell: UICollectionViewCell {

    @IBOutlet weak var messageReceiver: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        messageReceiver.text = "How can I help you?"
    }
    
    func binding(message: Message) {
        messageReceiver.text = message.content
    }

}


