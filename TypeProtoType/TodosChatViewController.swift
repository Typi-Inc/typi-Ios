//
//  TodosChatViewController.swift
//  TypeProtoType
//
//  Created by Type Inc on 12.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit

class TodosChatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var cellId = "TodosChatCell"
    @IBOutlet weak var TodoView: UIView!
    var TodoViewhidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 48
        self.tableView.allowsSelection = false
        
        // Do any additional setup after loading the view.
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: table view delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! TodosChatTableViewCell
        cell.initWithData("Run the app again, and it will look nothing has really changed. You are now using your bioLabel, but it’s just showing one line of text in each cell. Even though the number of lines is set to 0 and your constraints are properly configured so your bioLabel ta", time: "17:35 am")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc: TodosChatViewController = storyboard.instantiateViewControllerWithIdentifier("TodosChatViewController") as! TodosChatViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK: UIview animation 
    
    @IBAction func ShowHideAction(sender: UIBarButtonItem) {
        
        if self.TodoViewhidden {
            UIView.animateWithDuration(0.5, delay: 0, options: .TransitionCurlUp, animations: {
                var fabricTopFrame = self.TodoView.frame
                fabricTopFrame.origin.y -= fabricTopFrame.size.height
                self.TodoView.frame = fabricTopFrame
                }, completion: { finished in
                    self.TodoViewhidden = false
//                    sender.image = UIImage(named: "arrowDown")
                    self.navigationItem.title = "Send presentation to John and arrange a meeting"
            })
        }else{
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                        var fabricTopFrame = self.TodoView.frame
                        fabricTopFrame.origin.y += fabricTopFrame.size.height
                        self.TodoView.frame = fabricTopFrame
                }, completion: { finished in
                    self.TodoViewhidden = true
//                    sender.image = UIImage(named: "arrowUp")
                    self.navigationItem.title = ""
            })
        }
    }
   
    
}