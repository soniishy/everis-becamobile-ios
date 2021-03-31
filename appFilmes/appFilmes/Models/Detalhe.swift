//
//  Detalhe.swift
//  appFilmes
//
//  Created by Soni Hachtel Ishy on 3/31/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Detalhe: NSObject {
    
    let title: String
    let voteAverage: Double
    let posterPath: String
    let id: Int
    let overview: String
//    let filme: Filme
    
    init(title: String, voteAverage: Double, posterPath: String, id: Int, overview: String) {
        self.title = title
        self.voteAverage = voteAverage
        self.posterPath = posterPath
        self.id = id
        self.overview = overview
//        self.filme = filme
    }
}
