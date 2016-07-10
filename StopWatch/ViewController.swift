//
//  ViewController.swift
//  StopWatch
//
//  Created by Sam on 5/11/16.
//  Copyright © 2016 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbl_timer_display: UILabel!
    var time_elapsed:Int = 0
    var mins:Int = 0
    var timer = NSTimer()
    
    func startTimer() {
        time_elapsed += 1
        
        
        if time_elapsed == 60 {
            mins += 1
            time_elapsed = 0
        }
        
        let seconds:String = (time_elapsed < 10 ? "0\(time_elapsed)" : "\(time_elapsed)")
 
        let mins_display:String = (mins < 10 ? "0\(mins)" : "\(mins)")
        
        lbl_timer_display.text = "\(mins_display):\(seconds)"
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.startTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        time_elapsed = 0
        mins = 0
        lbl_timer_display.text = "00:00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_timer_display.text = "00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

