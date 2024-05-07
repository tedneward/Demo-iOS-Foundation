//
//  ViewController.swift
//  GCDFun
//
//  Created by Ted Neward on 11/2/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func btnLogItPressed(_ sender: Any) {
    NSLog("User pressed Log It! So we logged it!")
  }

  // {{## BEGIN broken ##}}
  @IBAction func btnBrokenPressed(_ sender: Any) {
    NSLog("btnBrokenPressed!")
    Thread.sleep(forTimeInterval: 10)
    NSLog("btnBrokenPressed returning")
  }
  // {{## END broken ##}}
  
  // {{## BEGIN simple ##}}
  @IBOutlet weak var btnSimple: UIButton!
  @IBOutlet weak var simpleSpinner: UIActivityIndicatorView!
  @IBAction func btnSimplePressed(_ sender: Any) {
    simpleSpinner.startAnimating()
    btnSimple.setTitle("Busy...", for: .normal)
    btnSimple.isEnabled = false
    DispatchQueue.global().async {
      Thread.sleep(forTimeInterval: 10)
      DispatchQueue.main.async {
        self.simpleSpinner.stopAnimating()
        self.btnSimple.setTitle("Start", for: .normal)
        self.btnSimple.isEnabled = true
      }
    }
  }
  // {{## END simple ##}}

  // {{## BEGIN progress ##}}
  @IBOutlet weak var progress: UIProgressView!
  @IBAction func btnProgressPushed(_ sender: Any) {
    progress.setProgress(0.0, animated: true)
    DispatchQueue.global().async {
      for i in 1..<11 {
        Thread.sleep(forTimeInterval: 1)
        DispatchQueue.main.async {
          self.progress.setProgress(Float(i) / 10, animated: true)
        }
      }
    }
  }
  // {{## END progress ##}}

  // {{## BEGIN stoppable-setup ##}}
  @IBOutlet weak var btnStoppable: UIButton!
  @IBOutlet weak var labelProgress: UILabel!
  private var shouldStop = false
  private var count = 1
  // {{## END stoppable-setup ##}}
  // {{## BEGIN stoppable-start ##}}
  @IBAction func btnStoppablePressed(_ sender: Any) {
    if btnStoppable.title(for: .normal) == "Start" {
      btnStoppable.setTitle("Stop", for: .normal)
      labelProgress.text = "Counting..."
      
      DispatchQueue.global().async {
        self.count = 1
        self.shouldStop = false
        repeat {
          Thread.sleep(forTimeInterval: 1)
          DispatchQueue.main.async {
            self.labelProgress.text = "\(self.count)"
            self.count = self.count + 1
          }
        } while self.shouldStop == false
        // {{## END stoppable-start ##}}
        // {{## BEGIN stoppable-stop ##}}
        // ... still in Dispatch.global() async ...
        // If we're here, counting stopped; reset the UI
        DispatchQueue.main.async {
          self.btnStoppable.setTitle("Start", for: .normal)
        }
      }
    }
    else {
      // Stop the counting
      self.shouldStop = true
    }
  }
  // {{## END stoppable-stop ##}}

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

