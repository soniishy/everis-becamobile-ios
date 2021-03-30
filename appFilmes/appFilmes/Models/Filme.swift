// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

class Filme: NSObject {
    
    let title: String
    let voteAverage: Double
    let posterPath: String
    let id: Int
    let overview: String
    
    init(title: String, voteAverage: Double, posterPath: String, id: Int, overview: String) {
        self.title = title
        self.voteAverage = voteAverage
        self.posterPath = posterPath
        self.id = id
        self.overview = overview
    }
}
