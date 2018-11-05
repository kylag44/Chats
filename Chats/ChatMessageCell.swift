//
//  ChatMessageCell.swift
//  Chats
//
//  Created by Kyla  on 2018-11-05.
//  Copyright © 2018 Kyla . All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

let messageLabel = UILabel()
let bubbleBackgroundView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    bubbleBackgroundView.backgroundColor = .yellow
    bubbleBackgroundView.layer.cornerRadius = 5
    bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(bubbleBackgroundView)
    
    addSubview(messageLabel)
//    messageLabel.backgroundColor = .green
    messageLabel.numberOfLines = 0
    messageLabel.text = "I'm providing a nice long string so I can test out my auto sizing and other testing functions for this app. I really love cheeseburgers and poutine. It may just be my favourite meal 🍔🍟"
    
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    
    //set up contraints for messageLabel
    let constraints = [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
    messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
    messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
    messageLabel.widthAnchor.constraint(equalToConstant: 250),
    
    bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
    bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
    bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
    bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
    ]

    NSLayoutConstraint.activate(constraints)
//    messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
