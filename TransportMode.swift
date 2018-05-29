//
//  TransportMode.swift
//  Transit_Tracker
//
//  Created by Keertika on 5/4/18.
//  Copyright © 2018 Keertika. All rights reserved.
//

import Foundation

let transportmodes = [
    TransportMode(name: "CTA Buses",
                  type: .bus, longDescription: "Search for CTA Bus Routes"),
    TransportMode(name: "CTA 'L' Trains",
                  type: .train, longDescription: "Search for CTA 'L' train routes"),
]

class TransportMode {
    
    enum `Type`: String {
        case bus = "bus"
        case train = "train"
    }
    
    var name: String
    var type: Type
    var longDescription: String
    
    init(name: String, type: Type, longDescription: String) {
        self.name = name
        self.type = type
        self.longDescription = longDescription
    }
    
}
