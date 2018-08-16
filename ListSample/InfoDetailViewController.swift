//
//  InfoDetailViewController.swift
//  ListSample
//
//  Created by 김영석 on 2018. 8. 13..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit
import RealmSwift

class InfoDetailViewController: UIViewController {
    
    let realm = try! Realm()
    
    var detailName: String = ""
    var detailTime: Double = 0
    var detailHarder: String = ""
    
    @IBOutlet weak var viewRecordImage: UIImageView!
    @IBOutlet weak var viewRecordName: UILabel!
    @IBOutlet weak var viewRecordTime: UILabel!
    @IBOutlet weak var viewRecordHarder: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func detailLoad() {
        
        viewRecordName.text = "이름 : \(detailName)"
        viewRecordTime.text = "걸린시간 : \(String(detailTime))"
        viewRecordHarder.text = "난이도 : \(detailHarder)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
