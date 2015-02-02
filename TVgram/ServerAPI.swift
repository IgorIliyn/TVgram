//
//  ServerAPI.swift
//  TVgram
//
//  Created by Igor Iliyn on 2/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ServerAPI: NSObject {
    let data: NSData!
    override init() {
        super.init()
        data = NSData()
    }
    func loadWatchList() -> NSDictionary {
        var dic: NSDictionary = NSDictionary()
        
        return dic
    }
}
