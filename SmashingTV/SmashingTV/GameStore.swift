//
//  GameStore.swift
//  Smash Smash
//
//  Created by Timothy Barrett on 4/27/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import Foundation
import Parse
class GameStore: NSObject {
    static let shared:GameStore = GameStore()
    
    func uploadScore(withPlayerName name:String, withScore score:Int, completion:(success:Bool, err:NSError?)->Void) {
        let object = PFObject(className: "SSLeaderBoard", dictionary: ["name":name, "score":score])
        object.saveInBackgroundWithBlock { (success, err) in
            if err == nil {
                completion(success: success, err: nil)
            } else {
                completion(success: false, err: err)
            }
        }
    }
    
    func getTopScores(completion:(leaders:[Leader], error:NSError?)->Void) {
        let query = PFQuery(className: "SSLeaderBoard")
        query.limit = 100 // limit to first 100 leaders
        query.orderByDescending("score")
        query.findObjectsInBackgroundWithBlock { (results, error) in
            if error == nil {
                if results != nil {
                    var leaders:[Leader] = [Leader]()
                    for leader in results! {
                        print(leader["name"])
                        print(leader["score"])
                        leaders.append(Leader(withLeaderName: leader["name"] as? String, withLeaderScore: leader["score"] as? Int))
                    }
                    completion(leaders: leaders, error: nil)
                } else {
                    completion(leaders: [Leader](), error: nil)
                }
            } else {
                completion(leaders: [Leader](), error: error)
            }
        }
    }
}