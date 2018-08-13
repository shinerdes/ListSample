//
//  RankViewController.swift
//  ListSample
//
//  Created by 김영석 on 2018. 8. 4..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit
import RealmSwift

var tabSIGN = 1

class RankViewController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        

        
        if (item.title! == "easy") {
            tabSIGN = 1

            
        }
        
        if (item.title! == "normal") {
             tabSIGN = 2
    
        }
        
        if (item.title! == "hard") {
          
             tabSIGN = 3
     
        }
        
    }
    
    

    
//    var stockCode:String? = findStockCode("Facebook")
//    let text = "Stock Code - "
//    if stockCode {
//    let message = text + stockCode!
//    println(message)
//    }

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
