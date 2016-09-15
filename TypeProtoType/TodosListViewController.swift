//
//  TodosListViewController.swift
//  TypeProtoType
//
//  Created by Type Inc on 12.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit
import Foundation

class TodosListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate {
    var textCellIdentifier = "TodosCell"
    var filteredresult = [TodoModel]()
    var cellModels = [TodoModel]()
    var Viewhidden = false
    
    
    @IBOutlet weak var MainContView: UIView!
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation  = false
        searchController.searchBar.placeholder = "Search here ... "
        definesPresentationContext = true
    
//        searchController.dimsBackgroundDuringPresentation = false

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.titleView = searchController.searchBar
//        self.tableView.tableHeaderView = searchController.searchBar
//        self.navigationController?.hidesBarsOnSwipe = true
        
            cellModels = [TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "15", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message", time: "17:35 am", countMessage: "2", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "3", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message ", time: "17:35 am", countMessage: "4", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "2", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "15", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "1", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "5", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "5", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "5", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message  ", time: "17:35 am", countMessage: "5", imageName: "circle-face-550"),
                          TodoModel(body:"Test Message for application", time: "17:35 am", countMessage: "5", imageName: "circle-face-550")]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SwitchTodosAction(sender: UISegmentedControl) {
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredresult.count
        }
        return self.cellModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! TodosTableViewCell
        var model : TodoModel
        
        if searchController.active && searchController.searchBar.text != "" {
            model = filteredresult[indexPath.row]
        } else {
            model = cellModels[indexPath.row]
        }

        cell.initWithModel(model)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc: TodosChatViewController = storyboard.instantiateViewControllerWithIdentifier("TodosChatViewController") as! TodosChatViewController
        
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)

    }
    
    func filterContentForSearchText(searchText: String) {
        filteredresult = cellModels.filter({( todoModel : TodoModel) -> Bool in
           return todoModel.body.containsString(searchText.lowercaseString)

        })
        tableView.reloadData()
    }
    
    @IBAction func ShowSearchAction(sender: UIBarButtonItem) {
        self.MainContView.hidden = false
        if self.Viewhidden {
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                var fabricTopFrame = self.MainContView.frame
                fabricTopFrame.origin.y += fabricTopFrame.size.height
                self.MainContView.frame = fabricTopFrame
                }, completion: { finished in
                    self.Viewhidden = true
                    //                    sender.image = UIImage(named: "arrowUp")
                    //                    self.navigationItem.title = ""
            })

        }else{
            UIView.animateWithDuration(0.5, delay: 0, options: .TransitionCurlUp, animations: {
                var fabricTopFrame = self.MainContView.frame
                fabricTopFrame.origin.y -= fabricTopFrame.size.height
                self.MainContView.frame = fabricTopFrame
                }, completion: { finished in
                    self.Viewhidden = false
                    //                    sender.image = UIImage(named: "arrowDown")
                    //                    self.navigationItem.title = "Send presentation to John and arrange a meeting"
            })

        }

    }
    
    
    
}