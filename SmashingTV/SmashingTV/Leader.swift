//
//  Leader.swift
//  Smash Smash
//
//  Created by Timothy Barrett on 4/27/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import Foundation

class Leader: NSObject {
    var leaderName:String?
    var leaderScore:Int?
    
    init(withLeaderName name:String?, withLeaderScore score:Int?) {
        self.leaderName = name
        self.leaderScore = score
    }
}