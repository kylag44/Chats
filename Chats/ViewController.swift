//
//  ViewController.swift
//  Chats
//
//  Created by Kyla  on 2018-11-05.
//  Copyright © 2018 Kyla . All rights reserved.
//

import UIKit

struct ChatMessage {
  let text: String
  let isIncoming: Bool
}

class ViewController: UITableViewController {
  
  fileprivate let cellId = "id123"
  
  let chatMessages = [
  ChatMessage(text: "Here's my first message", isIncoming: true),
  ChatMessage(text: "This is a longer message that will hopefully wrap", isIncoming: false),
  ChatMessage(text: "The longest message of this array bunch, let's see how well the autoresizing works on this puppy! 🐶 I love the dog emoji, what is your favourite emoji if you don't mind me asking", isIncoming: false),
  ChatMessage(text: "Boo!", isIncoming: true),
  ChatMessage(text: "This message should appear on the left side with a white text bubble", isIncoming: true)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Messages"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
    tableView.separatorStyle = .none
    tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chatMessages.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
  
    let chatMessage = chatMessages[indexPath.row]
    
    cell.chatMessage = chatMessage
    
    return cell
  }

}

