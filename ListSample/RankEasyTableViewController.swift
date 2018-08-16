//
//  RankTableViewController.swift
//  ListSample
//
//  Created by 김영석 on 2018. 8. 9..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit
import RealmSwift

class RankEasyTableViewController: UITableViewController {
    
    
    
    let realm = try! Realm()
    var easyCount = 0
    var openRecord: Results<Record>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRecord()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return openRecord?.count ?? 1
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "easycell", for: indexPath)
       
        
        
        //cell.textLabel?.text = " Row \(indexPath.row)"
       
        if let recordies = openRecord?[indexPath.row] {
      
            
            cell.textLabel?.text = "\(indexPath.row+1)위   \(recordies.name)   \(String(recordies.time))초"
           
        }
        
        
        return cell

     
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: "easyToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // didselectrow data send detail view controller
        
        let detailVC = segue.destination as! InfoDetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            detailVC.detailHarder = openRecord![indexPath.row].harder
            detailVC.detailTime = openRecord![indexPath.row].time
            detailVC.detailName = openRecord![indexPath.row].name
        }
        
    }
 
    
    func loadRecord() {
        
        let predicate = NSPredicate(format: "harder = 'easy'")
        
        openRecord = realm.objects(Record.self).filter(predicate).sorted(byKeyPath: "time")
            
        
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! InfoDetailViewController
//        
//        if let indexPath = tableView.indexPathForSelectedRow{
//            destinationVC.selectedCategory = openRecord?[indexPath.row]
//        }
//    }
//
//   
//  
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

}
