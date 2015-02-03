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
    }
    
}
