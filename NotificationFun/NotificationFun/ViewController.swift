//
//  ViewController.swift
//  NotificationFun
//
//  Created by Ted Neward on 10/26/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

  // {{## BEGIN notifications ##}}
  @IBOutlet weak var btnNotifications: UIButton!
  @IBAction func btnNotificationsPressed(_ sender: UIButton) {
    if (btnNotifications.currentTitle == "Start Notification Listener") {
      btnNotifications.setTitle("Stop Notifications", for: .normal)
      NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: nil, object: nil)
    }
    else {
      btnNotifications.setTitle("Start Notification Listener", for: .normal)
      NotificationCenter.default.removeObserver(self)
    }
  }
  
  @objc func notificationReceived(n: Notification) {
    NSLog("Received" + n.description)
  }
  // {{## END notifications ##}}
  
  // {{## BEGIN timer-management ##}}
  private var timer: Timer? = nil
  @IBOutlet weak var btnPsychedelic: UIButton!
  @IBAction func btnPsychedelicPressed(_ sender: Any) {
    if (timer == nil) {
      btnPsychedelic.setTitle("Stop Psychedelic Timer", for: .normal)
      
      let timeInterval = TimeInterval(0.5)
      timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    else {
      btnPsychedelic.setTitle("Start Psychedelic Timer", for: .normal)
      timer!.invalidate()
      timer = nil
    }
  }
  // {{## END timer-management ##}}

  // {{## BEGIN timer ##}}
  @objc func timerFired(t: Timer) {
    if (backgroundIndex == backgrounds.count) {
      backgroundIndex = 0
    }
    
    view.backgroundColor = backgrounds[backgroundIndex]
    backgroundIndex += 1
  }

  private var backgrounds : [UIColor] = [
    UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray,
    UIColor.green, UIColor.lightGray, UIColor.magenta, UIColor.orange,
    UIColor.purple, UIColor.red, UIColor.yellow
  ]
  private var backgroundIndex = 0
  // {{## END timer ##}}
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

