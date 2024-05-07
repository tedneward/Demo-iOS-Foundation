import Foundation

let jsonData = 
  ("[{\"lastName\":\"Neward\",\"firstName\":\"Ted\"}," + 
   "{\"lastName\":\"Neward\",\"firstName\":\"Charlotte\"}]")
   .data(using: .utf8)

let people = try JSONSerialization.jsonObject(with: jsonData!)
print(people)
