//
//  ChatModel.swift
//  TypeProtoType
//
//  Created by Type Inc on 09.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit

class ChatModel {
    var name = String()
    var text = String()
    var imageName = String()
    var messageCount = String()
    
    init (name:String, text:String, imageName:String, messageCount:String ){
        self.name = name
        self.text = text
        self.imageName = imageName
        self.messageCount = messageCount
        
    }
}
