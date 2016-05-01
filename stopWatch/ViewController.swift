//
//  ViewController.swift
//  stopWatch
//
//  Created by Clay Walter on 5/1/16.
//  Copyright © 2016 Clayhero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var timer = NSTimer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    
    var stopWatchString: String = ""
    
    var startStopWatch: Bool = true
    var addLap: Bool = false
    
    
    @IBOutlet var stopWatchLabel: UILabel!
    
    @IBOutlet var lapsTableView: UITableView!
    
    @IBOutlet var startstopButton: UIButton!
    
    @IBOutlet var resetButton: UIButton!
    
    @IBAction func startstop(sender: AnyObject) {
        
        if startStopWatch == true {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.updateStopWatch), userInfo: nil, repeats: true)
            startStopWatch = false
            
            startstopButton.setImage(UIImage(named: "stopButton.png"), forState: UIControlState.Normal)
            
            
            
            addLap = true
            
        } else {
            
            timer.invalidate()
            startStopWatch = true
            
            startstopButton.setImage(UIImage( named: "startButton.png"), forState: .Normal)
            
            resetButton.setImage(UIImage(named: "resetButton.png"), forState: UIControlState.Normal)
            
            addLap = false
            
        }
        
    }
    
    @IBAction func lapReset(sender: AnyObject) {
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopWatchLabel.text = "00:00.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateStopWatch() {
        
        fractions += 1
        
        if fractions == 100 {
        
            seconds += 1
            fractions = 0
            
        }
        
        if seconds == 60 {
            
            minutes += 1
            seconds = 0
            
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopWatchString = "\(minutesString):\(secondsString).\(fractionsString)"
        stopWatchLabel.text = stopWatchString
        
    }
    

    // Table View Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        
        cell.backgroundColor = self.view.backgroundColor
        
        cell.textLabel!.text = "Lap"
        
        cell.detailTextLabel?.text = "00:00:00"
        
        return cell

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    

}



