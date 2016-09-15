//
//  TodosTableViewCell.swift
//  TypeProtoType
//
//  Created by Type Inc on 12.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit

class TodosTableViewCell: UITableViewCell {

    @IBOutlet weak var checkedButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var countMessageLabel: UILabel!

    @IBAction func CheckedButtomAction(sender: UIButton) {
        sender.setImage(UIImage(named: "todo-2"), forState: UIControlState.Normal)
    }
    
    func initWithData(body:String , time:String , countMessage:String, imageName:String)  {
        dateLabel.text = time
        bodyLabel.text = body
        img.image = UIImage(named: imageName)
        countMessageLabel.text = countMessage
    }
    
    func initWithModel(model:TodoModel) {
        dateLabel.text = model.time
        bodyLabel.text = model.body
        img.image = UIImage(named: model.imageName)
        countMessageLabel.text = model.countMessage
        
    }

}
