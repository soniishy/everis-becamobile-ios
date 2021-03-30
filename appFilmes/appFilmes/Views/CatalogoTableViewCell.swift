//
//  CatalogoTableViewCell.swift
//  appFilmes
//
//  Created by Soni Hachtel Ishy on 3/30/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import AlamofireImage

class CatalogoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeFilme: UILabel!
    @IBOutlet weak var imagemPoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func mostraImagem(filme: Filme) {
        guard let salvaUrl = URL(string: filme.posterPath) else { return }
        imagemPoster.af_setImage(withURL: salvaUrl)
        nomeFilme.text = filme.title
    }

}
