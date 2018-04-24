//
//  ViewController.swift
//  Famsched
//
//  Created by Hongbo Niu on 2018-04-24.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class FamschedViewController: UITableViewController {
    
    
 let scheduleArray = ["schedule1","schedule2","schedule3","schedule4","schedule5"]
    let famName = ["Mommy","Daddy","Muge","Muyang","Muqi"]
    let dateArray = ["20180220","20180311","20180312","20180805","20180105"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO: register the ScheduleCell.xib file
        
        let nibName = UINib(nibName: "ScheduleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "famScheduleCell")
    }
    
    
    
    //MARK: TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "famScheduleCell", for: indexPath) as! FamScheduleCell
       

        cell.commonInit("p_\(indexPath.row)", title: famName[indexPath.row], date: dateArray[indexPath.row], things: scheduleArray[indexPath.row])
        return cell
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    

}

