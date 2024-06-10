//
//  ViewController.swift
//  ChatWithMe
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit

//Model of People
struct People {
    let avatar: String
    let name: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let homeCellIdentifier = "HomeCell"
    
    var people = [
        
        People(avatar: "a1", name: "Nguyen"),
        People(avatar: "a2", name: "Long"),
        People(avatar: "a3", name: "Vu"),
        People(avatar: "a4", name: "Dat")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Chat"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: homeCellIdentifier, bundle: nil), forCellReuseIdentifier: homeCellIdentifier)
        
       
    }
}

extension ViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier) as! HomeCell
        cell.binding(people: people[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chatDetails",
           let destinationVC = segue.destination as? ChatDetailsViewController,
           let selectedRow = sender as? People {
            destinationVC.people = selectedRow
        }
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected cell: \(indexPath.row)")
        
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "chatDetails") as! ChatDetailsViewController
        storyboard.receiverName = people[indexPath.row].name
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}

