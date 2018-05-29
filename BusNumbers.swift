//
//  BusNumber.swift
//  Transit_Tracker
//
//  Created by Keertika on 5/4/18.
//  Copyright © 2018 Keertika. All rights reserved.
//

import Foundation

let busnumbers = [
    BusNumbers(name: "J14 Jeffery Jump",
                  type: .bus1),
    BusNumbers(name: "29 State",
                  type: .bus2),
]

class BusNumbers {
    
    enum `Type`: String {
        case bus1 = "bus1"
        case bus2 = "bus2"
    }
    
    var name: String
    var type: Type
    
    init(name: String, type: Type) {
        self.name = name
        self.type = type
    }
    
}
