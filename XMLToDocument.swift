import Foundation

// {{## BEGIN xmldocument ##}}
let xmlStr = 
  "<people>" +
    "<person age='45'>" + 
      "<firstName>Ted</firstName>" + 
      "<lastName>Neward</lastName>" + 
    "</person>" +
    "<person age='39'>" + 
      "<firstName>Char</firstName>" + 
      "<lastName>Neward</lastName>" + 
    "</person>" +
  "</people>"

let xmlDoc = try XMLDocument(xmlString: xmlStr, options: 0)
print(xmlDoc)
// {{## END xmldocument ##}}

// {{## BEGIN xpath ##}}
let personNodes = try xmlDoc.nodes(forXPath: "//person")
print("All people: \(personNodes)")

let oldPersonNodes = try xmlDoc.nodes(forXPath: "//person[@age > 40]")
print("Old people: \(oldPersonNodes)")
// {{## END xpath ##}}
