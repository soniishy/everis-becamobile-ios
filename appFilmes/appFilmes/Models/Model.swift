// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import Alamofire
import AlamofireImage

// MARK: - Welcome
struct Welcome: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let overview: String
    let releaseDate: String?
    let adult: Bool?
    let backdropPath: String
    let genreIDS: [Int]
    let voteCount: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let posterPath: String
    let title: String?
    let video: Bool?
    let voteAverage: Double
    let id: Int
    let popularity: Double
    let mediaType: MediaType
    let firstAirDate, originalName: String?
    let originCountry: [String]?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case overview
        case releaseDate = "release_date"
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case title, video
        case voteAverage = "vote_average"
        case id, popularity
        case mediaType = "media_type"
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case name
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ru = "ru"
}
