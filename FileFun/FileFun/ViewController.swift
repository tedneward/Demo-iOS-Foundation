//
//  ViewController.swift
//  FileFun
//
//  Created by Ted Neward on 10/28/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTempDirUrl: UILabel!
    @IBOutlet weak var lblLibraryDirUrl: UILabel!
    @IBOutlet weak var lblUserDir: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // {{## BEGIN applicationHome ##}}
        let applicationHome = NSHomeDirectory()
        // {{## END applicationHome ##}}
        NSLog("applicationHome = \(applicationHome)")
          
        lblTempDirUrl!.text = NSTemporaryDirectory()
        
        let username = NSUserName()
        lblUserDir!.text = NSHomeDirectoryForUser(username)

        // {{## BEGIN contentsOfDirectory ##}}
        NSLog("==== contentsOfDirectory:")
        let fm = FileManager()
        if let files = try? fm.contentsOfDirectory(atPath: applicationHome ){
          for file in files {
            NSLog("... \(file)")
          }
        }

        NSLog("==== Enumerating .")
        let dirEnum = fm.enumerator(atPath: applicationHome)
        while let file = dirEnum?.nextObject() as? String {
            print(".../\(file)")
        }
        // {{## END contentsOfDirectory ##}}
    }

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}


}

