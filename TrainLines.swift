//
//  TrainLines.swift
//  Transit_Tracker
//
//  Created by Keertika on 5/4/18.
//  Copyright © 2018 Keertika. All rights reserved.
//

import Foundation

let trainlines = [
    TrainLines(name: "Red Line",
                  type: .redline),
    TrainLines(name: "Blue Line",
                  type: .blueline),
    TrainLines(name: "Brown Line",
               type: .brownline),
    TrainLines(name: "Green Line",
               type: .greenline),
    TrainLines(name: "Orange Line",
               type: .orangeline),
    TrainLines(name: "Purple Line",
               type: .purpleline),
    TrainLines(name: "Pink Line",
               type: .pinkline),
    TrainLines(name: "Yellow Line",
               type: .yellowline),
]

class TrainLines {
    
    enum `Type`: String {
        case redline = "redline"
        case blueline = "blueline"
        case brownline = "brownline"
        case greenline = "greenline"
        case orangeline = "orangeline"
        case purpleline = "purpleline"
        case pinkline = "pinkline"
        case yellowline = "yellowline"
    }
    
    var name: String
    var type: Type
    //var stations: [Int: String]
    
    init(name: String, type: Type) {
        self.name = name
        self.type = type
        //self.stations = stations
    }
    
}
