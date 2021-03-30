//
//  ViewController.swift
//  appFilmes
//
//  Created by Soni Hachtel Ishy on 3/29/21.
//  Copyright © 2021 Alura. All rights reserved.
//
import UIKit
import Foundation
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
    let genreIDS: [Int]
    let title: String
    let originalLanguage: OriginalLanguage
    let originalTitle, posterPath: String
    let video: Bool
    let voteAverage: Double
    let overview, releaseDate: String
    let voteCount, id: Int
    let adult: Bool
    let backdropPath: String
    let popularity: Double
    let mediaType: MediaType
    
    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case id, adult
        case backdropPath = "backdrop_path"
        case popularity
        case mediaType = "media_type"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ru = "ru"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listaDeFilmes: [Filme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requisicaoFilmes()
    }
    
    func requisicaoFilmes() {
        makeRequest { (listaDeFilmes) in
            print(self.listaDeFilmes[0].title)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func makeRequest(completion: @escaping (_ listaDeFilmes: [Filme]) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=ec8a35a874c21e92402e5ad81f4235a6&language=pt-BR")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let responseData = data else { return }
            
            do {
                let filmes = try JSONDecoder().decode(Welcome.self, from: responseData)
                let resultado = filmes.results
                
                for filme in resultado {
                    let nomeDoFilme = filme.title
                    let idDoFilme = filme.id
                    let posterPath = filme.posterPath
                    let caminhoPosterPath = "https://image.tmdb.org/t/p/w500\(posterPath)"
                    let filmeAtual = Filme(title: nomeDoFilme, posterPath: caminhoPosterPath, id: idDoFilme)
                    
                    self.listaDeFilmes.append(filmeAtual)
                }
                
//                print(self.listaDeFilmes)
                completion(self.listaDeFilmes)

            } catch let error {
                print("error \(error)")
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CatalogoTableViewCell
        let filmeAtual = listaDeFilmes[indexPath.row]
        print(filmeAtual.title)
        
        celula.mostraImagem(filme: filmeAtual)
        
        return celula
    }
}
