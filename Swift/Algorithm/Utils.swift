//
//  Utils.swift
//  Algorithm
//
//  Created by wz on 2018/12/17.
//  Copyright © 2018 wz. All rights reserved.
//

import Cocoa

class Utils: NSObject {

    static var time:TimeInterval = 0
    
    static func startTime() {
        time = Date().timeIntervalSince1970 * 1000
    }
    
    static func endTime() -> Int{
        if time == 0 {
            return 0
        }
        let r = Date().timeIntervalSince1970 * 1000 - time
        time = 0
        return Int(r)
    }
}
