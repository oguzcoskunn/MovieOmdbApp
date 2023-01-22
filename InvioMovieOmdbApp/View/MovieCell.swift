//
//  MovieCell.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 18.01.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    var movieImageView: UIImageView!
    var movieTitle: UILabel!
    var movieYear: UILabel!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildMovieCell()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func buildMovieCell() {
        
        movieImageView = UIImageView()
        
        contentView.addSubview(movieImageView)
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        movieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        movieTitle = UILabel()
        movieTitle.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        movieTitle.adjustsFontForContentSizeCategory = true
        
        contentView.addSubview(movieTitle)
        
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        movieTitle.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 5).isActive = true
        movieTitle.numberOfLines = .max
        
        let relaseDateTitle = UILabel()
        relaseDateTitle.text = "RELASE YEAR:"
        relaseDateTitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        relaseDateTitle.adjustsFontForContentSizeCategory = true
        
        addSubview(relaseDateTitle)
        
        relaseDateTitle.translatesAutoresizingMaskIntoConstraints = false
        relaseDateTitle.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        relaseDateTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20).isActive = true
        
        movieYear = UILabel()
        movieYear.font = UIFont.systemFont(ofSize: 15.0, weight: .light)
        movieYear.adjustsFontForContentSizeCategory = true
        
        contentView.addSubview(movieYear)
        
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        movieYear.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        movieYear.topAnchor.constraint(equalTo: relaseDateTitle.bottomAnchor, constant: 5).isActive = true
        
//        var lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
//        lineView.layer.borderWidth = 1.0
//        lineView.layer.borderColor = UIColor.black.cgColor
//        contentView.addSubview(lineView)
//
//        lineView.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10).isActive = true
        
    }
}
 
