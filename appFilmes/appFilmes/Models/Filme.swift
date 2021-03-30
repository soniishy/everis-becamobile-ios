// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

class Filme: NSObject {
    
    let title: String
    let posterPath: String
    let id: Int
    
    init(title: String, posterPath: String, id: Int) {
        self.title = title
        self.posterPath = posterPath
        self.id = id
    }
}
