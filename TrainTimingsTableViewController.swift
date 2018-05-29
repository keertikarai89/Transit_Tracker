//
//  TrainTimingsTableViewController.swift
//  Transit_Tracker
//
//  Created by Keertika on 5/4/18.
//  Copyright © 2018 Keertika. All rights reserved.
//

import UIKit
import SwiftyJSON

class TrainTimingsTableViewController: UITableViewController {
    
    var train_route: Train_Stations?
    var lineColor: Int?
    var timer: Timer!
    
    //var stationData: [Train_Stations]?
    //var backgroundColor: String
    
    
    class Record {
        var runNumber: String = ""
        var routeName: String = ""
        var destinationName: String = ""
        var timeNow: Date = Date()
        var timeArrival: Date = Date()
        var timeLeft: String = ""
        //var textcolor: String =
    }
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
        
    }
    
    var dataAvailable = false
    var records: [Record] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let lineName = train_route {
            loadData(lineName.Id)
        }
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(refreshScreen), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func refreshScreen() {
        if let lineName = train_route {
            loadData(lineName.Id)
        }
        //timer.invalidate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
       // timer.activate()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataAvailable ? records.count : 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (dataAvailable) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
            // Configure the cell...
            let record = records[indexPath.row]
        
            cell.textLabel?.text = "Train #" + record.runNumber + " to " + record.destinationName
            cell.detailTextLabel?.text = record.timeLeft
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        
            
            if record.routeName == "Y" {
                cell.backgroundColor = UIColor.yellow
                cell.textLabel?.textColor = UIColor.darkText
                cell.detailTextLabel?.textColor = UIColor.darkText
                
            }
        
            else if record.routeName == "Red" {
                cell.backgroundColor = UIColor.red
                
            }
            
            else if record.routeName == "Blue" {
                cell.backgroundColor = UIColor.blue
                
            }
            else if record.routeName == "Brn" {
                cell.backgroundColor = UIColor.brown
                
            }
            else if record.routeName == "G" {
                cell.backgroundColor = UIColor.green
                
            }
            else if record.routeName == "Org" {
                cell.backgroundColor = UIColor.orange
                
            }
            else if record.routeName == "P" {
                cell.backgroundColor = UIColor.purple
                
            }
            else if record.routeName == "Pink" {
                cell.backgroundColor = UIColor.magenta
                
            }
            
            return cell
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderCell", for: indexPath)
            return cell
        }
        
    }
    
    func loadData(_ Id: String) {
        
         let feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=9b69f38adf4341b99e95a543310251fa&mapid=" + Id + "&outputType=JSON"
        var validURL: URL?
        do {
        guard let feedURL = URL(string: feed) else {throw SerializationError.invalid("Invalid URL", feed)}
            validURL = feedURL
        }
            catch SerializationError.invalid(let msg, let url) { print("\(url) is \(msg)")}
            catch let error as NSError { print(error.localizedDescription)}
            
        let request = URLRequest(url: validURL!)
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            let json = try? JSON(data: data)
            let dateFormatter = DateFormatter()
            let currentTime: Date = dateFormatter.date(fromSwapiString: json!["ctatt"]["tmst"].stringValue)!
            
            self.records.removeAll()
            
            //currentTime = currentTime + 180 // add 2 minutes to test Due time
            for (_, e) in json!["ctatt"]["eta"] {
                do {
                guard let runNumber = e["rn"].string else {throw SerializationError.missing("runNumer") }
                guard let routeName = e["rt"].string else {throw SerializationError.missing ("routeName")}
                guard let destinationName = e["destNm"].string else {throw SerializationError.missing ("destinationName")}
                guard let timeArrival = e["arrT"].string else { throw SerializationError.missing("timeArrival")}
                   
                    let record = Record()
                    record.runNumber = runNumber
                    record.routeName = routeName
                    record.destinationName = destinationName
                    record.timeNow = currentTime
                    record.timeArrival = dateFormatter.date(fromSwapiString: timeArrival)!
             
                    
                    let timeLeft: Int = Int(
                        ((record.timeArrival.timeIntervalSinceReferenceDate - record.timeNow.timeIntervalSinceReferenceDate) / 60 ).rounded()
                    )
                    
                    if timeLeft > 0 {
                        record.timeLeft = String(timeLeft) + " min"
                    } else {
                        record.timeLeft = "Delayed"
                    }
                    
                    self.records.append(record)
                    }
                catch SerializationError.missing(let msg) {print ("Missing \(msg)")}
                catch SerializationError.invalid(let msg, let data) { print("Invalid \(msg): \(data)")}
                catch let error as NSError { print(error.localizedDescription)}
            }
            
            
            self.dataAvailable = true
            DispatchQueue.main.async{
                self.tableView.reloadData()
               
            }
            
            }.resume()
        
    }
    
}

extension DateFormatter {
    func date(fromSwapiString dateString: String) -> Date? {
        // SWAPI dates look like: "2014-12-10T16:44:31.486000Z"
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return self.date(from: dateString)
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


