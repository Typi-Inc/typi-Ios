//
//  TodosChatTableViewCell.swift
//  TypeProtoType
//
//  Created by Type Inc on 12.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit

class TodosChatTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    func initWithData(bodY:String, time:String) {
        bodyLabel.text = bodY
        timeLabel.text = time
    }
}
