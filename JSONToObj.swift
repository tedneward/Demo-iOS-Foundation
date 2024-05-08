import Foundation

// {{## BEGIN swift-types ##}}
let jsonData = 
  ("[{\"lastName\":\"Neward\",\"firstName\":\"Ted\"}," + 
   "{\"lastName\":\"Neward\",\"firstName\":\"Charlotte\"}]")
   .data(using: .utf8)

let people = try JSONSerialization.jsonObject(with: jsonData!)
print(people)
// {{## END swift-types ##}}

// {{## BEGIN codable-decoding ##}}
struct Person : Codable {
    let firstName: String
    let lastName: String
    //let favoritePhrases: Array<String>
        // this will trip an error if there isn't a field in the JSON
}

let decoder = JSONDecoder()
let persons = try decoder.decode(Array<Person>.self, from: jsonData!)
print(persons)
// {{## END codable-decoding ##}}
