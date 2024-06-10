//
//  ChatDetailsViewController.swift
//  ChatWithMe
//
//  Created by Long Nguyen on 10/6/24.
//

import UIKit

struct Message {
    let content: String
    let sender: String
    let receiver: String
    let createdDate: Date
}

class ChatDetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    var message: [Message] = []
    private var messageCellIdentifier = "messageCell"
    
    var people: People?
    var receiverName: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = receiverName
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension ChatDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        message.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: messageCellIdentifier, for: indexPath)
        
        //Configure the cell
        let message = message[indexPath.item]
        cell.contentView.subviews.forEach {
            $0.removeFromSuperview() }
        
        let label = UILabel(frame: cell.contentView.bounds)
        label.text = message.content
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        
        return cell
    }
}

extension ChatDetailsViewController: UICollectionViewDelegate {}

