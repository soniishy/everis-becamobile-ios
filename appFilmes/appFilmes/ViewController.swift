//
//  ViewController.swift
//  appFilmes
//
//  Created by Soni Hachtel Ishy on 3/29/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    var apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getPopularMoviesData()
        
//        apiService.getPopularMoviesData { (result) in
//            print(result)
//        }
    }
    
    func getPopularMoviesData() {
        
        let popularMoviesURL = "https://api.themoviedb.org/3/trending/all/week?api_key=ec8a35a874c21e92402e5ad81f4235a6&language=pt-BR"
        
        guard let url = URL(string: popularMoviesURL) else {return}
        
        // Create URL Session - work on the background
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let responseData = data else { return }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Welcome.self, from: responseData)
//                print(jsonData)
                
                let resultado = jsonData.results
                
                guard let titulo = resultado[0].title else { return }
                print(resultado)
                for filme in resultado {
                    
//                    guard let id = filme.id else { return }
                }
                
                // Back to the main thread
//                DispatchQueue.main.async {
//                    completion(.success(jsonData))

            } catch let error {
                print(error)
//                completion(.failure(error))
            }
            
        }
        dataTask.resume()
    }
}

