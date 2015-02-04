//
//  WatchViewController.swift
//  TVgram
//
//  Created by Igor Ilyin on 2/1/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var items: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = NSMutableArray()
        let nib:UINib = UINib(nibName:"WatchTableViewCell", bundle:nil)
        //self.tableView.registerClass(WatchTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
        self.tabBarItem.selectedImage =  UIImage(named: "eye-icon_active.png")
        var url: NSURL = NSURL(string: "http://www.test.tvgram.ru/upload.php")!
        
        var downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data: NSData! , response: NSURLResponse! , error: NSError!) -> Void in
            if error != nil {
                println(error)
            } else {
                self.items = self.parseWatchedList(data)
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    })
            }
        })
        downloadTask.resume()
        
    }

    func parseWatchedList(object: NSData!) -> NSMutableArray {
        var array = NSMutableArray()
//        var error: NSError?
//        var json: NSDictionary = NSJSONSerialization.JSONObjectWithData(object, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        
        var error:NSError? = nil
        if let jsonObject: AnyObject = NSJSONSerialization.JSONObjectWithData(object, options: nil, error:&error) {
            if let dict = jsonObject as? NSMutableArray {
                for item in dict {
                    var listItem: WatchItem = WatchItem()
                    listItem.name = item.objectForKey("name") as NSString
                    listItem.season = item.objectForKey("season") as NSNumber
                    listItem.season_name = item.objectForKey("season_name") as NSString
                    listItem.series = item.objectForKey("series") as NSNumber
                    listItem.image_url = item.objectForKey("image_url") as NSString
                    array.addObject(listItem)
                    println(item)
                }
                println(dict)
            } else {
                println("not a array")
                
            }
        } else {
            println("Could not parse JSON: \(error!)")
        }
        return array
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
        return self.items.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let identifier = "Cell"
        var cell: WatchTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? WatchTableViewCell
        if cell == nil {
            var nib: NSArray = NSBundle.mainBundle().loadNibNamed("WatchTableViewCell", owner: self, options: nil)
            cell = nib.objectAtIndex(0) as WatchTableViewCell
        }
        
        // perform additional custom work...
        var item: WatchItem = items.objectAtIndex(indexPath.row) as WatchItem
        cell.name.text = item.name
        cell.season.text = item.season.stringValue + " сезон, " + item.series.stringValue + " серия:"
        cell.seasonName.text = item.season_name
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        if item.image == nil {
            cell.loader.startAnimating()
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                var data = NSData(contentsOfURL: NSURL(string: item.image_url)!)
                item.image = UIImage(data:data!)
                if data != nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        // update some UI
                        
                        cell.imageTV.image = UIImage(data: data!)
                        cell.imageTV.layer.masksToBounds = true
                        cell.imageTV.layer.cornerRadius = 5;
                        cell.loader.stopAnimating()
                    }
                }
            }
        }else{
            cell.loader.stopAnimating()
        }
        return cell
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125
    }
}
