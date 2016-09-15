//
//  ChatViewController.swift
//  TypeProtoType
//
//  Created by Type Inc on 09.09.16.
//  Copyright © 2016 Type Inc. All rights reserved.
//

import UIKit


class ChatTableViewController: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate{

    var textCellIdentifier = "ChatViewCell"
    var cellModels = [ChatModel]()
    var filteredresult = [ChatModel]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 104
//        navigationController?.hidesBarsOnSwipe = true
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation  = false
        searchController.searchBar.placeholder = "Search here ... "
        definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
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
    
    //MARK - tableview Delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredresult.count
        }
        return cellModels.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! ChatWithTextTableViewCell
        var model : ChatModel
            if searchController.active && searchController.searchBar.text != "" {
                model = filteredresult[indexPath.row]
            }else{
                model = cellModels[indexPath.row]
            }
        cell .initWithModel(model)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc: MessageTableViewController = storyboard.instantiateViewControllerWithIdentifier("MessageTableViewController") as! MessageTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredresult = cellModels.filter({( todoModel : ChatModel) -> Bool in
            return todoModel.text.containsString(searchText)
            
        })
        tableView.reloadData()
    }
}
