//
//  WatchViewController.swift
//  TVgram
//
//  Created by Igor Ilyin on 2/1/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let nib:UINib = UINib(nibName:"WatchTableViewCell", bundle:nil)
        //self.tableView.registerClass(WatchTableViewCell.self, forCellReuseIdentifier: "Cell")
        //self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let identifier = "Cell"
        var cell: WatchTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? WatchTableViewCell
        if cell == nil {
            tableView.registerNib(UINib(nibName: "WatchTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? WatchTableViewCell
        }
        
        return cell
    }
}
