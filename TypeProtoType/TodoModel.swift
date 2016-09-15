//
//  TodoModel.swift
//  TypeProtoType
//
//  Created by Type Inc on 13.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var  body : String = ""
    var time:String = ""
    var countMessage:String = ""
    var imageName :String = ""
    
    init(body:String, time:String,countMessage :String, imageName:String) {
        self.body = body
        self.time = time
        self.countMessage = countMessage
        self.imageName = imageName
    }
    
    
}
