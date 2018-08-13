//
//  SelectTableViewController.swift
//  ListSample
//
//  Created by 김영석 on 2018. 7. 31..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit


struct Info {
    var image : String
    var select : String
    var time : Int
  
    
}




class SelectTableViewController: UITableViewController{
    
    var headInfo = [
        Info(image : "easy", select: "Easy", time: 90),
        Info(image : "normal", select: "Normal", time: 60),
        Info(image : "hard", select: "Hard", time: 30),
        Info(image : "stats", select: "Stats", time: 0)
        // 마지막 셀은 랭킹 셀
       
        ]
 
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return headInfo.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // 선택 됬을시
   
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if (headInfo[indexPath.row].select == "Easy"){
            selectTime = timeInfo[0]
            harder = "easy"
            performSegue(withIdentifier: "gotoGame", sender: cell)
        }
        
        if (headInfo[indexPath.row].select == "Normal"){
            selectTime = timeInfo[1]
            harder = "normal"
            performSegue(withIdentifier: "gotoGame", sender: cell)
        }
        
        
        if (headInfo[indexPath.row].select == "Hard"){
            selectTime = timeInfo[2]
            harder = "hard"
            performSegue(withIdentifier: "gotoGame", sender: cell)
        }
        
        if (headInfo[indexPath.row].select == "Stats"){
      
            performSegue(withIdentifier: "gotoStats", sender: cell)
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        self.tableView.rowHeight = 145
//        if let displaytext = cell.textLabel?.text {}
        if headInfo[indexPath.row].select == "Stats"
        {
            cell.textLabel?.text = "랭킹"
            } else {
            cell.textLabel?.text = "난이도 : \(headInfo[indexPath.row].select)\n제한시간 : \(headInfo[indexPath.row].time)"
        }
        
      
        cell.imageView?.image = UIImage(named: headInfo[indexPath.row].image)
        
//        if let categoryForDeletion = self.categories?[indexPath.row] {
//            do {
//                try self.realm.write {
//                    self.realm.delete(categoryForDeletion)
//                }
//            } catch {
//                print("Error deleting category, \(error)")
//            }
//        }
        
        return cell
        
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = headInfo.count - 1
        let color = (1 - (CGFloat(index) / CGFloat(itemCount)) * 0.9)
        return UIColor(red: 0.9, green: color, blue: 0.3, alpha: 1.0)
    }
    
    
    
  
    // record?, event?
    

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
