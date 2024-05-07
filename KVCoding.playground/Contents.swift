//: Playground - noun: a place where people can play

import UIKit

// {{## BEGIN kvobject ##}}
class Person : NSObject {
  @objc var firstName = ""
  @objc var lastName = ""
  @objc var age = 0
}
// {{## END kvobject ##}}


// {{## BEGIN observer ##}}
class Observer : NSObject {
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "firstName" {
      print("Observing a change to firstName: \(change!) on \(object!)")
    }
  }
}
let o = Observer()
// {{## END observer ##}}

// {{## BEGIN observing ##}}
let p = Person()
p.firstName = "Fred"
p.observe(\.firstName) { person, change in
  print("firstName change on \(person) to \(change.newValue)")
}
p.addObserver(o, forKeyPath: "firstName", options: .new, context: nil)
p.setValue("Barney", forKey: "firstName")
print(p.firstName)
// {{## END observing ##}}

