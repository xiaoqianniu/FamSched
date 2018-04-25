//
//  ViewController.swift
//  Famsched
//
//  Created by Hongbo Niu on 2018-04-24.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit
import RealmSwift

class FamschedViewController: UITableViewController {
    
    let realm = try! Realm()
    var scheduleArray : Results<ScheduleData>!
    
    var nameTextField = UITextField()
    var thingsTextField = UITextField()
    var dateTextField : UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        //TODO: register the ScheduleCell.xib file
        
        let nibName = UINib(nibName: "ScheduleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "famScheduleCell")
    }
    
    
    
    //MARK: TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "famScheduleCell", for: indexPath) as! FamScheduleCell
       

        cell.commonInit("p_\(indexPath.row)", title:scheduleArray[indexPath.row].memberName, date: scheduleArray[indexPath.row].date, things: scheduleArray[indexPath.row].schedule)
        
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
            let schedules = ScheduleData()
            schedules.schedule.append(self.thingsTextField.text!)
            schedules.memberName.append(self.nameTextField.text!)
            schedules.date.append((self.dateTextField?.text)!)
            
            self.saveData(scheduleData: schedules)
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
    
    // TODO: Save the data
    func saveData(scheduleData:ScheduleData){
        do{
        try realm.write {
            realm.add(scheduleData)
        }
        }catch{
            print(error)
        }
        tableView.reloadData()
    }
    //TODO: Load the data
    func loadData(){
        
        scheduleArray = realm.objects(ScheduleData.self)
        
        tableView.reloadData()
        
    }
    

}

