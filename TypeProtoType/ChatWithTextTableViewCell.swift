//
//  ChatWithTextTableViewCell.swift
//  TypeProtoType
//
//  Created by Type Inc on 09.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit


class ChatWithTextTableViewCell: UITableViewCell {
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var IconImg: UIImageView!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var MessageCountLabel: UILabel!

    func initWithModel(chatModel:ChatModel){
        TextLabel.text = chatModel.text
        NameLabel.text = chatModel.name
        IconImg.image = UIImage (named: chatModel.imageName)
        MessageCountLabel.text = chatModel.messageCount
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
