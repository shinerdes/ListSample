//
//  ViewController.swift
//  ListSample
//
//  Created by 김영석 on 2018. 7. 22..
//  Copyright © 2018년 김영석. All rights reserved.
//
//



import UIKit
import Foundation
import GTProgressBar
import CountdownLabel
import RealmSwift

var timeInfo : [Int] = [90, 60, 30]
var selectTime = 0
var harder : String = ""
var timer = Timer()
var finalTime : Double = 0


class ViewController: UIViewController {
    
    let realm = try! Realm()
    var recordes = [Record]() //realm

    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    
    //button outlet
    

    
    @IBOutlet weak var countLabel: UILabel! // label로 대체
    
    @IBOutlet weak var progressBar: GTProgressBar!
    
       //progress

    let firstTime = selectTime // 초기값 고정 셋팅

    var seconds = selectTime
    var milliseconds = 0 // 밀리 세컨드
 
 
    var openCloseFLAG = 0
    var closeFLAG = 0
    var beforeButton = (UIButton)()
    
  
    var correctCount = 0 // 현재 맞춘 짝의 갯수 : max = 8

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        progressBarSetting()
        startTimer()
        qsImageSet()
        definition()
        progressRun()
        
        countLabel.text = ("\(seconds) : \(String(format: "%02i", milliseconds))")
  
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0) //배경화면

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        endTimer() //home으로 돌아가면 시간 측정 멈춤
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func clickButton1(_ sender: UIButton) {
        button1.setImage(#imageLiteral(resourceName: "door.png"), for: UIControlState.normal) //door

        openCloseFLAG = openCloseFLAG + 1
        
        if(openCloseFLAG == 1) {
            beforeButton = button1
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
         
            
            if(button1.currentImage == beforeButton.currentImage) {
                button1.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button1.isEnabled = false
                button1.setImage(#imageLiteral(resourceName: "door.png"), for: UIControlState.normal) //door
               
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button1.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button1.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                
               
            }
            
            openCloseFLAG = 0
        }
    }
    
    
    
    
    
    @IBAction func clickButton2(_ sender: UIButton) {
        button2.setImage(#imageLiteral(resourceName: "door.png"), for: UIControlState.normal) //door

        openCloseFLAG = openCloseFLAG + 1
        
        if(openCloseFLAG == 1) {
            beforeButton = button2
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button2.currentImage == beforeButton.currentImage) {
                button2.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button2.isEnabled = false
                button2.setImage(#imageLiteral(resourceName: "door.png"), for: UIControlState.normal) //door
                

                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button2.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button2.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
            }
            
            openCloseFLAG = 0
        }
    }
    
    
    @IBAction func clickButton3(_ sender: UIButton) {
        button3.setImage(#imageLiteral(resourceName: "building.png"), for: UIControlState.normal) //building

        openCloseFLAG = openCloseFLAG + 1
        
        if(openCloseFLAG == 1) {
            beforeButton = button3
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button3.currentImage == beforeButton.currentImage) {
                button3.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                
                button3.isEnabled = false
                button3.setImage(#imageLiteral(resourceName: "building.png"), for: UIControlState.normal) //building
             
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button3.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button3.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
            }
            
            openCloseFLAG = 0
        }
    }
    
    
    @IBAction func clickButton4(_ sender: UIButton) {
        button4.setImage(#imageLiteral(resourceName: "building.png"), for: UIControlState.normal) //building

        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button4
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button4.currentImage == beforeButton.currentImage) {
                button4.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button4.isEnabled = false
                button4.setImage(#imageLiteral(resourceName: "building.png"), for: UIControlState.normal) //building
                
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button4.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button4.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                   
                }
                //답이 다를경우 마무리 해야할 영역
                
                
             
                
            }
            
            openCloseFLAG = 0
    }
        
    
        
 }
    

    @IBAction func clickButton5(_ sender: UIButton) {
        button5.setImage(#imageLiteral(resourceName: "footballcup.png"), for: UIControlState.normal) //footballcup
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button5
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button5.currentImage == beforeButton.currentImage) {
                button5.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button5.isEnabled = false
                button5.setImage(#imageLiteral(resourceName: "footballcup.png"), for: UIControlState.normal) //footballcup
                
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button5.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button5.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
        
    }
    @IBAction func clickButton6(_ sender: UIButton) {
        button6.setImage(#imageLiteral(resourceName: "footballcup.png"), for: UIControlState.normal) //footballcup
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button6
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button6.currentImage == beforeButton.currentImage) {
                button6.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button6.isEnabled = false
                button6.setImage(#imageLiteral(resourceName: "footballcup.png"), for: UIControlState.normal) //footballcup
                
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button6.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button6.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
        
    }
    @IBAction func clickButton7(_ sender: UIButton) {
        button7.setImage(#imageLiteral(resourceName: "giftbox.png"), for: UIControlState.normal) //giftbox
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button7
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button7.currentImage == beforeButton.currentImage) {
                button7.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button7.isEnabled = false
                button7.setImage(#imageLiteral(resourceName: "giftbox.png"), for: UIControlState.normal) //giftbox
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button7.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button7.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
        
    }
    @IBAction func clickButton8(_ sender: UIButton) {
        button8.setImage(#imageLiteral(resourceName: "giftbox.png"), for: UIControlState.normal) //giftbox
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button8
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button8.currentImage == beforeButton.currentImage) {
                button8.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button8.isEnabled = false
                button8.setImage(#imageLiteral(resourceName: "giftbox.png"), for: UIControlState.normal) //giftbox
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button8.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button8.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    
    @IBAction func clickButton9(_ sender: UIButton) {
        button9.setImage(#imageLiteral(resourceName: "house.png"), for: UIControlState.normal) //house
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button9
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button9.currentImage == beforeButton.currentImage) {
                button9.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button9.isEnabled = false
                button9.setImage(#imageLiteral(resourceName: "house.png"), for: UIControlState.normal) //house
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button9.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button9.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
  
    @IBAction func clickButton10(_ sender: UIButton) {
        button10.setImage(#imageLiteral(resourceName: "house.png"), for: UIControlState.normal) //house
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button10
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button10.currentImage == beforeButton.currentImage) {
                button10.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button10.isEnabled = false
                button10.setImage(#imageLiteral(resourceName: "house.png"), for: UIControlState.normal) //house
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button10.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button10.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    @IBAction func clickButton11(_ sender: UIButton) {
        button11.setImage(#imageLiteral(resourceName: "iphone.png"), for: UIControlState.normal) //iphone
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button11
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button11.currentImage == beforeButton.currentImage) {
                button11.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button11.isEnabled = false
                button11.setImage(#imageLiteral(resourceName: "iphone.png"), for: UIControlState.normal) //iphone
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button11.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button11.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    @IBAction func clickButton12(_ sender: UIButton) {
        button12.setImage(#imageLiteral(resourceName: "iphone.png"), for: UIControlState.normal) //iphone
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button12
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button12.currentImage == beforeButton.currentImage) {
                button12.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button12.isEnabled = false
                button12.setImage(#imageLiteral(resourceName: "iphone.png"), for: UIControlState.normal) //iphone
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button12.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button12.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    @IBAction func clickButton13(_ sender: UIButton) {
        button13.setImage(#imageLiteral(resourceName: "table.png"), for: UIControlState.normal) //table
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button13
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button13.currentImage == beforeButton.currentImage) {
                button13.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button13.isEnabled = false
                button13.setImage(#imageLiteral(resourceName: "table.png"), for: UIControlState.normal) //table
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button13.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button13.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    @IBAction func clickButton14(_ sender: UIButton) {
        button14.setImage(#imageLiteral(resourceName: "table.png"), for: UIControlState.normal) //table
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button14
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button14.currentImage == beforeButton.currentImage) {
                button14.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button14.isEnabled = false
                button14.setImage(#imageLiteral(resourceName: "table.png"), for: UIControlState.normal) //table
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button14.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button14.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    @IBAction func clickButton15(_ sender: UIButton) {
        button15.setImage(#imageLiteral(resourceName: "chair.png"), for: UIControlState.normal) //chair
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button15
            beforeButton.isEnabled = false
            
        }
        
        if(openCloseFLAG == 2) {
            if(button15.currentImage == beforeButton.currentImage) {
                button15.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
                
            }
            else{
                button15.isEnabled = false
                button15.setImage(#imageLiteral(resourceName: "chair.png"), for: UIControlState.normal) //chair
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button15.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button15.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    @IBAction func clickButton16(_ sender: UIButton) {
        button16.setImage(#imageLiteral(resourceName: "chair.png"), for: UIControlState.normal) //chair
        
        openCloseFLAG = openCloseFLAG + 1
        
        
        
        if(openCloseFLAG == 1) {
            beforeButton = button16
            beforeButton.isEnabled = false
        }
        
        if(openCloseFLAG == 2) {
            if(button16.currentImage == beforeButton.currentImage) {
                button16.isEnabled = false
                beforeButton.isEnabled = false
                correctCount = correctCount + 1
                checkCompleteGame()
               
            }
            else{
                button16.isEnabled = false
                button16.setImage(#imageLiteral(resourceName: "chair.png"), for: UIControlState.normal) //chair
                
                let time = DispatchTime.now() + .milliseconds(50)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    // 5초 후에 일어날 일
                    self.button16.isEnabled = true
                    self.beforeButton.isEnabled = true
                    self.beforeButton.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal) //qs
                    self.button16.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
                    
                }
                //답이 다를경우 마무리 해야할 영역
                
                
                
                
            }
            
            openCloseFLAG = 0
        }
    }
    

    
    func shuffleArray(arrayToBeShuffled array1: [(Int,Int)]) -> [(Int,Int)]{
        var oldArray = array1
        var newArray = [(Int,Int)]()
        var randomNumber: Int
        
        for _ in array1 {
            
            randomNumber = Int(arc4random_uniform(UInt32(oldArray.count)))
            newArray.append(oldArray[randomNumber])
            oldArray.remove(at: randomNumber)
        }
        
        return newArray
    }
    
    func qsImageSet() { // 이미지 설정
        button1.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button2.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button3.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button4.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button5.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button6.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button7.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button8.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button9.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button10.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button11.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button12.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button13.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button14.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button15.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
        button16.setImage(#imageLiteral(resourceName: "qs.png"), for: UIControlState.normal)
       
        button1.layer.cornerRadius = 30
        button1.clipsToBounds = true
        button2.layer.cornerRadius = 30
        button2.clipsToBounds = true
        button3.layer.cornerRadius = 30
        button3.clipsToBounds = true
        button4.layer.cornerRadius = 30
        button4.clipsToBounds = true
        button5.layer.cornerRadius = 30
        button5.clipsToBounds = true
        button6.layer.cornerRadius = 30
        button6.clipsToBounds = true
        button7.layer.cornerRadius = 30
        button7.clipsToBounds = true
        button8.layer.cornerRadius = 30
        button8.clipsToBounds = true
        button9.layer.cornerRadius = 30
        button9.clipsToBounds = true
        button10.layer.cornerRadius = 30
        button10.clipsToBounds = true
        button11.layer.cornerRadius = 30
        button11.clipsToBounds = true
        button12.layer.cornerRadius = 30
        button12.clipsToBounds = true
        button13.layer.cornerRadius = 30
        button13.clipsToBounds = true
        button14.layer.cornerRadius = 30
        button14.clipsToBounds = true
        button15.layer.cornerRadius = 30
        button15.clipsToBounds = true
        button16.layer.cornerRadius = 30
        button16.clipsToBounds = true
      
        
        
        
       
    }
    
    func definition() { // 좌표 기준으로 버튼을 랜덤으로
        
        var totalArray = [(18,186),(18,259),(18,332),(18,405),(91,186),(91,259),(91,332),(91,405),(164,186),(164,259),(164,332),(164,405),(237,186),(237,259),(237,332),(237,405)]
        
        var shakeArray = [(Int,Int)]()
        
        shakeArray = (shuffleArray(arrayToBeShuffled: totalArray))

        
        button1.frame = CGRect(x: shakeArray[0].0, y: shakeArray[0].1, width: 65, height: 65)
        button2.frame = CGRect(x: shakeArray[1].0, y: shakeArray[1].1, width: 65, height: 65)
        button3.frame = CGRect(x: shakeArray[2].0, y: shakeArray[2].1, width: 65, height: 65)
        button4.frame = CGRect(x: shakeArray[3].0, y: shakeArray[3].1, width: 65, height: 65)
        button5.frame = CGRect(x: shakeArray[4].0, y: shakeArray[4].1, width: 65, height: 65)
        button6.frame = CGRect(x: shakeArray[5].0, y: shakeArray[5].1, width: 65, height: 65)
        button7.frame = CGRect(x: shakeArray[6].0, y: shakeArray[6].1, width: 65, height: 65)
        button8.frame = CGRect(x: shakeArray[7].0, y: shakeArray[7].1, width: 65, height: 65)
        button9.frame = CGRect(x: shakeArray[8].0, y: shakeArray[8].1, width: 65, height: 65)
        button10.frame = CGRect(x: shakeArray[9].0, y: shakeArray[9].1, width: 65, height: 65)
        button11.frame = CGRect(x: shakeArray[10].0, y: shakeArray[10].1, width: 65, height: 65)
        button12.frame = CGRect(x: shakeArray[11].0, y: shakeArray[11].1, width: 65, height: 65)
        button13.frame = CGRect(x: shakeArray[12].0, y: shakeArray[12].1, width: 65, height: 65)
        button14.frame = CGRect(x: shakeArray[13].0, y: shakeArray[13].1, width: 65, height: 65)
        button15.frame = CGRect(x: shakeArray[14].0, y: shakeArray[14].1, width: 65, height: 65)
        button16.frame = CGRect(x: shakeArray[15].0, y: shakeArray[15].1, width: 65, height: 65)

        
    }
    
    func startTimer() { // 시간 측정 시작

        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countDownfunction), userInfo: nil, repeats: true)
        
    }

    
    @objc func countDownfunction() {
   
        if milliseconds == 0 {
            
            seconds -= 1
            milliseconds = 100
            progressRun()
            countLabel.text = ("\(seconds) : \(String(format: "%02i", milliseconds))")
            
        } else {
            milliseconds -= 1
            countLabel.text = ("\(seconds) : \(String(format: "%02i", milliseconds))")
            //progressRun()
        }
        
        if seconds == 0 && milliseconds == 0 { // 0 : 00 일시
            
            timer.invalidate()

            endTimer()
            notSuccessEvent()
            timeoverProgressBarSetting()
            countLabel.text = "It's not easy"
            
        }
        
    }

    
    
    func endTimer() {
        
        timer.invalidate() // 시간 멈춤
    }

    func progressRun() {
 
        
        progressBar.animateTo(progress: (CGFloat(1-(Float(Float(seconds)/Float(firstTime))))))
       
        //   1- (90.....1초  / 90초)
    }
    
    func notSuccessEvent() { // 성공못하면 카드 다 오픈
        
        button1.setImage(#imageLiteral(resourceName: "door.png"), for: UIControlState.normal)
        button2.setImage(#imageLiteral(resourceName: "door.png"), for: UIControlState.normal)
        button3.setImage(#imageLiteral(resourceName: "building.png"), for: UIControlState.normal)
        button4.setImage(#imageLiteral(resourceName: "building.png"), for: UIControlState.normal)
        button5.setImage(#imageLiteral(resourceName: "footballcup.png"), for: UIControlState.normal)
        button6.setImage(#imageLiteral(resourceName: "footballcup.png"), for: UIControlState.normal)
        button7.setImage(#imageLiteral(resourceName: "giftbox.png"), for: UIControlState.normal)
        button8.setImage(#imageLiteral(resourceName: "giftbox.png"), for: UIControlState.normal)
        button9.setImage(#imageLiteral(resourceName: "house.png"), for: UIControlState.normal)
        button10.setImage(#imageLiteral(resourceName: "house.png"), for: UIControlState.normal)
        button11.setImage(#imageLiteral(resourceName: "iphone.png"), for: UIControlState.normal)
        button12.setImage(#imageLiteral(resourceName: "iphone.png"), for: UIControlState.normal)
        button13.setImage(#imageLiteral(resourceName: "table.png"), for: UIControlState.normal)
        button14.setImage(#imageLiteral(resourceName: "table.png"), for: UIControlState.normal)
        button15.setImage(#imageLiteral(resourceName: "chair.png"), for: UIControlState.normal)
        button16.setImage(#imageLiteral(resourceName: "chair.png"), for: UIControlState.normal)
        
        
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
        button10.isEnabled = false
        button11.isEnabled = false
        button12.isEnabled = false
        button13.isEnabled = false
        button14.isEnabled = false
        button15.isEnabled = false
        button16.isEnabled = false
       
        
    }
    
    func checkCompleteGame() { //갯수 체크
        if (correctCount == 8){ // 다 맞출시
            
            if milliseconds != 0 {
                finalTime = ((Double(firstTime) - Double(seconds) - 1.0) + (100.0-Double(milliseconds))/100.0)
                
            } // 남은 시간 계산
            if milliseconds == 0 {
                finalTime = (Double(firstTime) - Double(seconds)) + (Double(milliseconds)/100.0)
            }
            
            
                timer.invalidate()
                countLabel.text = "콩그레츄레이션"
                commitRecord()
            
            
         
         
          
        }
    }
    
    
    func progressBarSetting() {
        progressBar.progress = 0
        progressBar.barBorderColor = UIColor(red:0.55, green:0.40, blue:0.80, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.25, green:0.50, blue:0.86, alpha:1.0)
        progressBar.barBackgroundColor = UIColor(red:0.90, green:0.53, blue:0.28, alpha:1.0)
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = UIColor(red:0.75, green:0.30, blue:0.36, alpha:1.0)
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
        
    }
    
    func timeoverProgressBarSetting() {
        progressBar.progress = 0
        progressBar.barBorderColor = UIColor(red:0.05, green:0.50, blue:0.10, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.05, green:0.50, blue:0.86, alpha:1.0)
        progressBar.barBackgroundColor = UIColor(red:0.00, green:0.53, blue:0.28, alpha:1.0)
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = UIColor(red:0.75, green:0.30, blue:0.36, alpha:1.0)
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        
    }
    
    func commitRecord() { // 기록 저장
        
        var nameTextField = UITextField()
        
        let alert = UIAlertController(title: "이름을 입력하세요", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "이름 등록", style: .default) { (action) in
            
            let recordHistory = Record()
            recordHistory.name = nameTextField.text!
            recordHistory.time = finalTime //밀리초까지 해줘야
            recordHistory.harder = harder // 난이도
            
            // 이미지 삽입
            self.save(record: recordHistory)
            
           
            
        }
     
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            nameTextField = field
            nameTextField.placeholder = "Add a Name"
        }
        
          present(alert, animated: true, completion: nil)
     
       
    }
    
    func save(record: Record) {
        do {
            try realm.write {
                realm.add(record)
            }
        } catch {
            print("Error saving record \(error)")
            
        }
        
      
     
        
    }
    
    
    



    
}

// 이름 작성 -> 확인 버튼 -> 카메라 or 앨범 -> 이미지 선택 -> realm 릴리즈
// realm에 있는 이미지 리스트 -> 랭킹에서 다 뿌려지기
// 랭킹에 있는 항목 누르기 -> 자세한 상세 정보
// 상세한 정보에서는 이미지는 크게 보이게 만듬
// 난이도별 tableview -> detailviewcontroller








