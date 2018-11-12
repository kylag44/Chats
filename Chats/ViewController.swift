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
  let date: Date
}

extension Date {
  static func dateFromCustomString(customString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter.date(from: customString) ?? Date()
  }
}

class ViewController: UITableViewController {
  
  fileprivate let cellId = "id123"

//  let chatMessages = [
//    [
//      ChatMessage(text: "Here's my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "11/07/2018")),
//      ChatMessage(text: "This is a longer message that will hopefully wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "11/07/2018"))
//    ],
//    [
//      ChatMessage(text: "The longest message of this array bunch, let's see how well the autoresizing works on this puppy! 🐶 I love the dog emoji, what is your favourite emoji if you don't mind me asking", isIncoming: false, date: Date.dateFromCustomString(customString: "11/09/2018")),
//      ChatMessage(text: "Boo!", isIncoming: true, date: Date.dateFromCustomString(customString: "11/09/2018")),
//      ChatMessage(text: "This message should appear on the left side with a white text bubble", isIncoming: true, date: Date.dateFromCustomString(customString: "11/07/2018"))
//    ],
//    [
//      ChatMessage(text: "This is another test text for the third section", isIncoming: true, date: Date.dateFromCustomString(customString: "11/10/2018"))
//    ]
//  ]
  
  let messagesFromServer = [
      ChatMessage(text: "Here's my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "11/07/2018")),
      ChatMessage(text: "This is a longer message that will hopefully wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "11/07/2018")),
      ChatMessage(text: "The longest message of this array bunch, let's see how well the autoresizing works on this puppy! 🐶 I love the dog emoji, what is your favourite emoji if you don't mind me asking", isIncoming: false, date: Date.dateFromCustomString(customString: "11/09/2018")),
      ChatMessage(text: "Boo!", isIncoming: true, date: Date.dateFromCustomString(customString: "11/09/2018")),
      ChatMessage(text: "This message should appear on the left side with a white text bubble", isIncoming: true, date: Date.dateFromCustomString(customString: "11/07/2018")),
      ChatMessage(text: "This is another test text for the third section", isIncoming: true, date: Date.dateFromCustomString(customString: "11/10/2018"))
  ]
  
  fileprivate func attemptToAssembleGroupMessages() {
    print("Attempt to group messages together based on date property")
    
    let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
      return element.date
    }
    
    //provide sorting for keys
    let sortedKeys = groupedMessages.keys.sorted()
    sortedKeys.forEach { (key) in
      let values = groupedMessages[key]
      chatMessages.append(values ?? [])
    }
      
//    groupedMessages.keys.forEach { (key) in
//    print(key)
//      let values = groupedMessages[key]
//      print(values ?? " ")
//
//      chatMessages.append(values ?? [])
//    }
//    print(groupedMessages)
  }
  
  var chatMessages = [[ChatMessage]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    attemptToAssembleGroupMessages()
    
    navigationItem.title = "Messages"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
    tableView.separatorStyle = .none
    tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return chatMessages.count
  }
  
  class DateHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .black
      textColor = .white
      textAlignment = .center
      translatesAutoresizingMaskIntoConstraints = false //enables autolayout
      font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
      let originalContentSize = super.intrinsicContentSize
      let height = originalContentSize.height + 16
      layer.cornerRadius = height / 2
      layer.masksToBounds = true
      return CGSize(width: originalContentSize.width + 20, height: originalContentSize.height + 16)
    }
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    if let firstMessageInSection = chatMessages[section].first {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yyyy"
      let dateString = dateFormatter.string(from: firstMessageInSection.date)
      
      let label = DateHeaderLabel()
     
      label.text = dateString
      
      let containerView = UIView()
      
      containerView.addSubview(label)
      label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
      label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
      
      return containerView
    }
   return nil
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chatMessages[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
  
    let chatMessage = chatMessages[indexPath.section][indexPath.row]
    
    cell.chatMessage = chatMessage
    
    return cell
  }

}

