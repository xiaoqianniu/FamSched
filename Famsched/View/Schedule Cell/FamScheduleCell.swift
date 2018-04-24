//
//  ScheduleTableViewCell.swift
//  Famsched
//
//  Created by Hongbo Niu on 2018-04-24.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class FamScheduleCell: UITableViewCell {
    
    @IBOutlet weak var familyPicture: UIImageView!
    
    @IBOutlet weak var familyName: UILabel!
    
    @IBOutlet weak var dates: UILabel!
    
    @IBOutlet weak var futureThings: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ imageName:String, title:String, date:String, things:String){
        familyPicture.image = UIImage(named: imageName)
        familyName.text = title
        dates.text = date
        futureThings.text = things
    }
    
}
