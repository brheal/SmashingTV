//
//  MainScreenViewController.swift
//  SmashingTV
//
//  Created by Timothy Barrett on 4/27/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var leaderTableView: UITableView!
    @IBOutlet weak var allTimeScore: UILabel!
    @IBOutlet weak var allTimePlayer: UILabel!
    private var leaders:[Leader] = [Leader]()
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderTableView.delegate = self
        leaderTableView.dataSource = self
        leaderTableView.registerNib(UINib(nibName: "LeaderCell", bundle: nil), forCellReuseIdentifier: LeaderCell.reuseID)
        // Do any additional setup after loading the view.
        leaderTableView.rowHeight = UITableViewAutomaticDimension
        leaderTableView.estimatedRowHeight = 500
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
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

}

extension MainScreenViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaders.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(LeaderCell.reuseID, forIndexPath: indexPath) as! LeaderCell
        let aLeader = leaders[indexPath.row]
        cell.playerNameLabel.text = aLeader.leaderName
        if aLeader.leaderScore != nil {
            cell.playerScoreLabel.text = "\(aLeader.leaderScore!)"
        }
        return cell
    }
    
    func reloadData() {
        GameStore.shared.getTopScores { (leaders, error) in
            dispatch_async(dispatch_get_main_queue(), { 
                self.leaders = leaders
                if let firstLeader = self.leaders.first {
                    self.allTimePlayer.text = firstLeader.leaderName
                    if firstLeader.leaderScore != nil {
                        self.allTimeScore.text = "\(firstLeader.leaderScore)"
                    }
                }
                self.leaderTableView.reloadData()
            })
        }
    }
}
