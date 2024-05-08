import Foundation

// {{## BEGIN single-object ##}}
let person = [
  "firstName" : "Ted",
  "lastName" : "Neward"
]
print(person)

let personJson = try JSONSerialization.data(withJSONObject: person)
let personJsonString = String(data: personJson, encoding: .utf8)
print(personJsonString!)
// {{## END single-object ##}}

// {{## BEGIN multi-object ##}}
let people = [
  [ "firstName" : "Ted", "lastName" : "Neward"],
  [ "firstName" : "Charlotte", "lastName" : "Neward" ]
]
let peopleJson = try JSONSerialization.data(withJSONObject: people)
let peopleJsonString = String(data: peopleJson, encoding: .utf8)
print(peopleJsonString!)
// {{## END multi-object ##}}

// {{## BEGIN codable-encoding ##}}
struct Person : Codable {
    let firstName: String
    let lastName: String
    //let favoritePhrases: Array<String>
        // this will trip an error if there isn't a field in the JSON
}
let persons = [
    Person(firstName: "Ted", lastName: "Neward"),
    Person(firstName: "Charlotte", lastName: "Neward"),
]

let encoder = JSONEncoder()
let personsJson = try encoder.encode(persons)
print(personsJson)
// {{## END codable-encoding ##}}
