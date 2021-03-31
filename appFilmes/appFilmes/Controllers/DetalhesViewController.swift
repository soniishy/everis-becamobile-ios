// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import UIKit
import AlamofireImage

// MARK: - Welcome
struct FilmeDetalhe: Codable {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollection?
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name, posterPath: String
    let backdropPath: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


class DetalhesViewController: UIViewController {

    @IBOutlet weak var detalhePoster: UIImageView!
    @IBOutlet weak var detalheTitulo: UILabel!
    @IBOutlet weak var detalheRate: UILabel!
    @IBOutlet weak var detalheSinopse: UILabel!
    
    var filmeSelecionado: Filme? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requisicaoFilmes()
    }
    
    func requisicaoFilmes() {
        
        DispatchQueue.main.async {
            guard let filme = self.filmeSelecionado else { return }
            self.makeRequest(filmeAtual: filme) { (detalhesDosFilmes) in
                self.mostraInfo(mostraOsDetalhes: detalhesDosFilmes)
            }
        }
    }
    
    func mostraInfo(mostraOsDetalhes: Detalhe) {
//        guard let mostraOsDetalhes = detalhesDosFilmes else { return }
        
        guard let salvaUrl = URL(string: mostraOsDetalhes.posterPath) else { return }
        detalhePoster.af_setImage(withURL: salvaUrl)
        detalheTitulo.text = mostraOsDetalhes.title
        detalheRate.text = String(mostraOsDetalhes.voteAverage)
        detalheSinopse.text = mostraOsDetalhes.overview
        
    }
    
    private func makeRequest(filmeAtual: Filme, completion: @escaping (_ detalhesDosFilmes: Detalhe) -> Void) {
        
        let id = String(filmeAtual.id)
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=ec8a35a874c21e92402e5ad81f4235a6&language=pt-BR")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let responseData = data else { return }
            
            do {
                let detalhesFilme = try JSONDecoder().decode(FilmeDetalhe.self, from: responseData)
                
                print(detalhesFilme)
                
                    let nomeDoFilme = detalhesFilme.title
                    let notaDoFilme = detalhesFilme.voteAverage
                    let idDoFilme = detalhesFilme.id
                    let posterPath = detalhesFilme.posterPath
                    let sinopse = detalhesFilme.overview
                    let caminhoPosterPath = "https://image.tmdb.org/t/p/w500\(posterPath)"
                let detalheDoFilme = Detalhe(title: nomeDoFilme, voteAverage: notaDoFilme, posterPath: caminhoPosterPath, id: idDoFilme, overview: sinopse)

                print(detalhesFilme.title)
                //                print(self.listaDeFilmes)
                completion(detalheDoFilme)
                
            } catch let error {
                print("error \(error)")
            }
        }
        task.resume()
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
