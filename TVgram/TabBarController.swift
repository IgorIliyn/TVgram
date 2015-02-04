//
//  TabBarController.swift
//  TVgram
//
//  Created by Igor Iliyn on 2/3/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        var image = UIImage(named: "header.png")
        self.navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        self.title = "Смотрю"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        var array:NSArray = self.tabBar.items!
        self.selectedIndex = 1
       
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!){
        switch item.tag {
        case 0:
            self.title = "Всё сразу"
            break
        case 1:
            self.title = "Смотрю"
            break
        case 2:
            self.title = "Буду смотреть"
            break
        case 3:
            self.title = "Посмотрел"
            break
        default:
            break
        }
    } // called when a new view is selected by the user (but not programatically)
   
}
