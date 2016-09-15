//
//  MessageTableViewController.swift
//  TypeProtoType
//
//  Created by Type Inc on 11.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit
import SlackTextViewController

class MessageTableViewController: SLKTextViewController{
    
    
    var cellModels = [ChatModel]()
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        self.inverted = false
        self.tableView!.registerClass(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
        
        self.tableView!.rowHeight = UITableViewAutomaticDimension
        self.tableView!.estimatedRowHeight = 64.0
        self.tableView!.separatorStyle = .None
        
        cellModels = [ChatModel(name: "Alex", text: "Hi man^ how are you", imageName: "circle-face-550", messageCount: "2"),
        ChatModel(name: "Shah", text: "Hi man^ how are you", imageName: "circle-face-550", messageCount: "2"),
        ChatModel(name: "Ten", text: "Hi man^ how are you", imageName: "circle-face-550", messageCount: "2"),
        ChatModel(name: "Rex", text: "Hi man^ how are you", imageName: "circle-face-550", messageCount: "2"),
        ChatModel(name: "Smoki", text: "Hi man^ how are you go cinema", imageName: "circle-face-550", messageCount: "2"),
        ChatModel(name: "Mo", text: "Hi man^ how are you call me later", imageName: "circle-face-550", messageCount: "2"),]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView Delegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCellWithIdentifier("MessageTableViewCell", forIndexPath: indexPath) as! MessageTableViewCell
        
        
        cell.initWithModel(cellModels[indexPath.row])
        cell.selectionStyle = .None
        return cell
    }
    
    override func didPressRightButton(sender: AnyObject!) {
        self.textView.refreshFirstResponder()
    }

}
