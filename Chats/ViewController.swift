//
//  ViewController.swift
//  Chats
//
//  Created by Kyla  on 2018-11-05.
//  Copyright © 2018 Kyla . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  fileprivate let cellId = "id123"
  
  let textMessages = ["Here's my first message", "This is a longer message that will hopefully wrap", "The longest message of this array bunch, let's see how well the autoresizing works on this puppy! 🐶 I love the dog emoji, what is your favourite emoji if you don't mind me asking"]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Messages"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
    tableView.separatorStyle = .none
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return textMessages.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
//    cell.textLabel?.text = "I'm providing a nice long string so I can test out my auto sizing and other testing functions for this app. I really love cheeseburgers and poutine. It may just be my favourite meal 🍔🍟"
//    cell.textLabel?.numberOfLines = 0
    cell.messageLabel.text = textMessages[indexPath.row]
    return cell
  }

}

