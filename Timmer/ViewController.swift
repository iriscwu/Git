//
//  ViewController.swift
//  Timmer
//
//  Created by Wen-lung Chang on 11/03/2018.
//  Copyright © 2018 calvin.chang. All rights reserved.
//

import UIKit

let START = "START"
let STOP = "STOP"
let PAUSE = "PAUSE"
let CONTINUE = "CONTINUE"

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet fileprivate weak var startBtn: UIBarButtonItem!
    @IBOutlet fileprivate weak var pauseBtn: UIButton!
    @IBOutlet fileprivate weak var recordTable: UITableView!
    @IBOutlet fileprivate weak var timerLabel: UILabel!
    @IBOutlet fileprivate weak var recordBtn: UIButton!
    
    fileprivate var timer : Timer!
    fileprivate var nowTime = 0;
    fileprivate var pauseTag = false;
    fileprivate var timeArray = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recordTable.dataSource = self;
        recordTable.delegate = self;
        recordTable.register(UINib.init(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickStart(_ sender: Any) {
        if(self.navigationItem.rightBarButtonItem?.title == START )
        {
            setTimeInit()
            self.navigationItem.rightBarButtonItem?.title = STOP;
        }
        else{
            
            timer.invalidate()
            timer = nil;
            nowTime = 0;
            timerLabel.text = timeString(time: TimeInterval(nowTime))
            self.navigationItem.rightBarButtonItem?.title = START;
            pauseBtn.setTitle(PAUSE, for: .normal);
            pauseBtn.isSelected = false;
            pauseTag = false;
            timeArray.removeAll();
            recordTable.reloadData();
            
        }
    }
    
    @objc func updateTime(){
        nowTime = nowTime + 1;
        timerLabel.text = timeString(time: TimeInterval(nowTime))
    }
    
    
    @IBAction func clickPause(_ sender: Any) {
        if(timer == nil){
            return;
        }
        else{
            if(pauseTag){
                setTimeInit()
                pauseTag = false;
                pauseBtn.setTitle(PAUSE, for: .normal)
                pauseBtn.isSelected = false;
            }
            else{
                timer.invalidate()
                pauseTag = true;
                pauseBtn.setTitle(CONTINUE, for: .normal)
                pauseBtn.isSelected = true;
            }
        }
    }

    
    @IBAction func clickRecord(_ sender: Any) {
        timeArray.append(timerLabel.text!)
        recordTable.reloadData()
    }
    
    
    func setTimeInit(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recordTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DataCell
//        cell.textLabel?.text = String(indexPath.row + 1) + "   " + timeArray[indexPath.row]
        cell.timeCell = timeArray[indexPath.row];
        cell.indexCell = indexPath.row + 1
        return cell
        
    }
    
}

