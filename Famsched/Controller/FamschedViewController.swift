//
//  ViewController.swift
//  Famsched
//
//  Created by Hongbo Niu on 2018-04-24.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class FamschedViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO: register the ScheduleCell.xib file
        
        let nibName = UINib(nibName: "ScheduleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "famScheduleCell")
    }
    
    
    
    //MARK: TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "famScheduleCell", for: indexPath) as! FamScheduleCell
        let scheduleArray = ["schedule1","schedule2","schedule3"]
        cell.futureThings.text = scheduleArray[indexPath.row]
        return cell
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    

}

