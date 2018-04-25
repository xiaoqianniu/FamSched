//
//  Data.swift
//  Famsched
//
//  Created by Hongbo Niu on 2018-04-25.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import Foundation
import RealmSwift

class Data : Object {
    @objc dynamic var memberName : String = ""
    @objc dynamic var date : String = ""
    @objc dynamic var schedule : String = ""
}
