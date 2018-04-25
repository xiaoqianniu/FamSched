//
//  ViewController.swift
//  Famsched
//
//  Created by Hongbo Niu on 2018-04-24.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class FamschedViewController: UITableViewController {
    
    
    var scheduleArray = ["schedule1","schedule2","schedule3","schedule4","schedule5"]
    var famName = ["Mommy","Daddy","Muge","Muyang","Muqi"]
    var dateArray = ["20180220","20180311","20180312","20180805","20180105"]
    
    var nameTextField = UITextField()
    var thingsTextField = UITextField()
    var dateTextField : UITextField?
    
    
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
        return scheduleArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    
    //    MARK: Alert Methods
    
    @IBAction func addScheduleAlert(_ sender: UIBarButtonItem) {
       let alert = UIAlertController(title: "Add New Schedule", message: nil, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (OKaction) in
          //what will happen when you press the ok button
            self.scheduleArray.append(self.thingsTextField.text!)
            self.famName.append(self.nameTextField.text!)
            self.dateArray.append((self.dateTextField?.text)!)
            self.tableView.reloadData()
            print("ok")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField{ (name) in
            name.placeholder = "who"
            self.nameTextField = name
            
        }
        alert.addTextField{(things) in
            things.placeholder = "what"
            self.thingsTextField = things
            
        }
        alert.addTextField{ (date) in
            date.placeholder = "when"
          self.dateTextField = date
            
        }
        
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    

}

