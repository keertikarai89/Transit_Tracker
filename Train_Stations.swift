//
//  Train_Stations.swift
//  Transit_Tracker
//
//  Created by Keertika on 5/8/18.
//  Copyright © 2018 Keertika. All rights reserved.
//

import Foundation

let RedLine = [
    Train_Stations("41230", "47th"),
    Train_Stations("40910", "63rd"),
    Train_Stations("40990", "69th"),
    Train_Stations("40240", "79th"),
    Train_Stations("41430", "87th"),
    Train_Stations("40450", "95th/Ran Ryan"),
    Train_Stations("41420", "Addison"),
    Train_Stations("41200", "Argyle"),
    Train_Stations("41320", "Belmont"),
    Train_Stations("40340", "Berwyn"),
    Train_Stations("41380", "Bryn Mawr"),
    Train_Stations("41000", "Cermak-Chinatown"),
    Train_Stations("41450", "Chicago"),
    Train_Stations("40630", "Clark/Division"),
    Train_Stations("41220", "Fullerton"),
    Train_Stations("41170", "Garfield"),
    Train_Stations("40330", "Grand"),
    Train_Stations("40760", "Granville"),
    Train_Stations("41490", "Harrison"),
    Train_Stations("40900", "Howard"),
    Train_Stations("40560", "Jackson"),
    Train_Stations("41190", "Jarvis"),
    Train_Stations("41660", "Lake"),
    Train_Stations("40770", "Lawrence"),
    Train_Stations("41300", "Loyola"),
    Train_Stations("41090", "Monroe"),
    Train_Stations("40100", "Morse"),
    Train_Stations("40650", "North/Clybourn"),
    Train_Stations("41400", "Roosevelt"),
    Train_Stations("40080", "Sheridan"),
    Train_Stations("40190", "Sox-35th"),
    Train_Stations("40880", "Thorndale"),
    Train_Stations("40540", "Wilson")
]

let BlueLine = [
    Train_Stations("40010", "Austin"),
    Train_Stations("40970", "Cicero"),
    Train_Stations("40430", "Clinton"),
    Train_Stations("40390", "Forest Park"),
    Train_Stations("40980", "Harlem"),
    Train_Stations("40810", "Illinois Medical District"),
    Train_Stations("40250", "Kedzie-Homan"),
    Train_Stations("41340", "LaSalle"),
    Train_Stations("40180", "Oak Park"),
    Train_Stations("40920", "Pulaski"),
    Train_Stations("40470", "Racine"),
    Train_Stations("40350", "UIC-Halsted"),
    Train_Stations("40220", "Western"),
    Train_Stations("41240", "Addison"),
    Train_Stations("40060", "Belmont"),
    Train_Stations("40570", "California"),
    Train_Stations("41410", "Chicago"),
    Train_Stations("40380", "Clark/Lake"),
    Train_Stations("40230", "Cumberland"),
    Train_Stations("40590", "Damen"),
    Train_Stations("40320", "Division"),
    Train_Stations("40490", "Grand"),
    Train_Stations("40750", "Harlem"),
    Train_Stations("40550", "Irving Park"),
    Train_Stations("40070", "Jackson"),
    Train_Stations("41280", "Jefferson Park"),
    Train_Stations("41020", "Logan Square"),
    Train_Stations("40790", "Monroe"),
    Train_Stations("41330", "Montrose"),
    Train_Stations("40890", "O'Hare"),
    Train_Stations("40820", "Rosemont"),
    Train_Stations("40370", "Washington"),
    Train_Stations("40670", "Western")
]

let BrownLine = [
    Train_Stations("40850", "Harold Washington Library-State/Van Buren"),
    Train_Stations("40160", "LaSalle/Van Buren"),
    Train_Stations("40680", "Adams/Wabash"),
    Train_Stations("41440", "Addison"),
    Train_Stations("40660", "Armitage"),
    Train_Stations("41320", "Belmont"),
    Train_Stations("40710", "Chicago"),
    Train_Stations("40090", "Damen"),
    Train_Stations("40530", "Diversey"),
    Train_Stations("40870", "Francisco"),
    Train_Stations("41220", "Fullerton"),
    Train_Stations("41460", "Irving Park"),
    Train_Stations("41180", "Kedzie"),
    Train_Stations("41290", "Kimball"),
    Train_Stations("40460", "Merchandise Mart"),
    Train_Stations("41500", "Montrose"),
    Train_Stations("41310", "Paulina"),
    Train_Stations("41010", "Rockwell"),
    Train_Stations("40800", "Sedgwick"),
    Train_Stations("40360", "Southport"),
    Train_Stations("41700", "Washington/Wabash"),
    Train_Stations("41210", "Wellington"),
    Train_Stations("41480", "Western"),
    Train_Stations("40380", "Clark/Lake"),
    Train_Stations("40260", "State/Lake")
]

let GreenLine = [
    Train_Stations("40170", "Ashland"),
    Train_Stations("40290", "Ashland/63rd"),
    Train_Stations("41260", "Austin"),
    Train_Stations("41360", "California"),
    Train_Stations("40280", "Central"),
    Train_Stations("40480", "Cicero"),
    Train_Stations("40380", "Clark/Lake"),
    Train_Stations("41160", "Clinton"),
    Train_Stations("41670", "Conservatory"),
    Train_Stations("40720", "Cottage Grove"),
    Train_Stations("40940", "Halsted"),
    Train_Stations("40020", "Harlem/Lake"),
    Train_Stations("41070", "Kedzie"),
    Train_Stations("41140", "King Drive"),
    Train_Stations("40700", "Laramie"),
    Train_Stations("41510", "Morgan"),
    Train_Stations("41350", "Oak Park"),
    Train_Stations("40030", "Pulaski"),
    Train_Stations("40610", "Ridgeland"),
    Train_Stations("40260", "State/Lake"),
    Train_Stations("41120", "35th-Bronzeville-IIT"),
    Train_Stations("41270", "43rd"),
    Train_Stations("41080", "47th"),
    Train_Stations("40130", "51st"),
    Train_Stations("40680", "Adams/Wabash"),
    Train_Stations("41690", "Cermak-McCormick Place"),
    Train_Stations("40510", "Garfield"),
    Train_Stations("40300", "Indiana"),
    Train_Stations("41400", "Roosevelt"),
    Train_Stations("41700", "Washington/Wabash")
]

let OrangeLine = [
    Train_Stations("40380", "Clark/Lake"),
    Train_Stations("40260", "State/Lake"),
    Train_Stations("40120", "35th/Archer"),
    Train_Stations("41060", "Ashland"),
    Train_Stations("41130", "Halsted"),
    Train_Stations("41150", "Kedzie"),
    Train_Stations("40930", "Midway"),
    Train_Stations("40960", "Pulaski"),
    Train_Stations("40040", "Quincy/Wells"),
    Train_Stations("41400", "Roosevelt"),
    Train_Stations("40730", "Washington/Wells"),
    Train_Stations("40310", "Western"),
    Train_Stations("40850", "Harold Washington Library-State/Van Buren"),
    Train_Stations("40160", "LaSalle/Van Buren")
]


let PurpleLine = [
    Train_Stations("41250", "Central"),
    Train_Stations("40050", "Davis"),
    Train_Stations("40690", "Dempster"),
    Train_Stations("40520", "Foster"),
    Train_Stations("40900", "Howard"),
    Train_Stations("41050", "Linden"),
    Train_Stations("40270", "Main"),
    Train_Stations("40400", "Noyes"),
    Train_Stations("40840", "South Boulevard")
]

let PinkLine = [
    Train_Stations("40830", "18th"),
    Train_Stations("40580", "54th/Cermak"),
    Train_Stations("40170", "Ashland"),
    Train_Stations("40440", "California"),
    Train_Stations("40780", "Central Park"),
    Train_Stations("40420", "Cicero"),
    Train_Stations("40380", "Clark/Lake"),
    Train_Stations("41160", "Clinton"),
    Train_Stations("40210", "Damen"),
    Train_Stations("41040", "Kedzie"),
    Train_Stations("40600", "Kostner"),
    Train_Stations("41510", "Morgan"),
    Train_Stations("41030", "Polk"),
    Train_Stations("40150", "Pulaski"),
    Train_Stations("40260", "State/Lake"),
    Train_Stations("40740", "Western"),
    Train_Stations("40040", "Quincy/Wells"),
    Train_Stations("40730", "Washington/Wells"),
    Train_Stations("40680", "Adams/Wabash"),
    Train_Stations("41700", "Washington/Wabash")
]

let YellowLine = [
    Train_Stations("40140", "Dempster-Skokie"),
    Train_Stations("41680", "Oakton-Skokie"),
    Train_Stations("40900", "Howard")
]


class Train_Stations {
    
    var Id: String
    var Name: String
    
    init(_ Id: String, _ Name: String) {
        
        self.Id = Id;
        self.Name = Name;
    }
    
}
