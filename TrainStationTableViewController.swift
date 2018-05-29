//
//  TrainStationTableViewController.swift
//  Transit_Tracker
//
//  Created by Keertika on 5/4/18.
//  Copyright © 2018 Keertika. All rights reserved.
//

import UIKit

//let stations = [ "Chicago", "Howard", "Loyola", "Belmont", "Fullerton", "Jackson"]


class TrainStationTableViewController: UITableViewController {
    
    var lineColor: Int?
    var stationData: [Train_Stations]?
    
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
        if let line = lineColor {
            switch line {
            case 0:
                stationData = RedLine
            case 1:
                stationData = BlueLine
            case 2:
                stationData = BrownLine
            case 3:
                stationData = GreenLine
            case 4:
                stationData = OrangeLine
            case 5:
                stationData = PurpleLine
            case 6:
                stationData = PinkLine
            case 7:
                stationData = YellowLine
            default:
                stationData = RedLine
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stationData!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = stationData![indexPath.row].Name
        
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let trainTimingsTableViewController = segue.destination as? TrainTimingsTableViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                trainTimingsTableViewController.train_route = stationData![indexPath.row]
                trainTimingsTableViewController.lineColor = lineColor
    }
    
}
}

}
