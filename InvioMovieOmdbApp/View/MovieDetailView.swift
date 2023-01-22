//
//  MovieDetailView.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 21.01.2023.
//

import UIKit

class MovieDetailView: UIView {
    var movieImageView: UIImageView!
    var movieGenre: UILabel!
    var movieDescription: UILabel!
    var movieAverage: UILabel!
    var movieRelaseDate: UILabel!
    var movieDirector: UILabel!
    var topBar = NavigationBarView()
    let loadingSpinner = UIActivityIndicatorView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildNavigationBar()
        buildMovieDetails()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func buildNavigationBar() {
        addSubview(topBar)
        topBar.titleLabel.leadingAnchor.constraint(equalTo: topBar.backArrowButton.trailingAnchor, constant: 10).isActive = true
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func buildMovieDetails() {
        
        movieImageView = UIImageView()
        
        addSubview(movieImageView)
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        movieImageView.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 20).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(loadingSpinner)
        
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingSpinner.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor).isActive = true
        loadingSpinner.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 20).isActive = true
        
        
        let imdbTitle = UILabel()
        imdbTitle.text = "IMDb RATING"
        imdbTitle.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        imdbTitle.adjustsFontForContentSizeCategory = true
        
        let relaseDateTitle = UILabel()
        relaseDateTitle.text = "RELASE DATE"
        relaseDateTitle.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        relaseDateTitle.adjustsFontForContentSizeCategory = true
        
        let directorTitle = UILabel()
        directorTitle.text = "DIRECTOR NAME"
        directorTitle.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        directorTitle.adjustsFontForContentSizeCategory = true
        
        let titlesStackView = UIStackView(arrangedSubviews: [imdbTitle ,relaseDateTitle, directorTitle])
        titlesStackView.axis = .horizontal
        titlesStackView.spacing = 20
        titlesStackView.alignment = .center
        
        addSubview(titlesStackView)
        
        titlesStackView.translatesAutoresizingMaskIntoConstraints = false
        titlesStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titlesStackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20).isActive = true
        
        let starImage = UIImageView()
        starImage.image = UIImage(named: "star-icon")
        
        addSubview(starImage)
        
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.leadingAnchor.constraint(equalTo: imdbTitle.leadingAnchor).isActive = true
        starImage.topAnchor.constraint(equalTo: imdbTitle.bottomAnchor, constant: 5).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        movieAverage = UILabel()
        movieAverage.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        movieAverage.adjustsFontForContentSizeCategory = true
        
        addSubview(movieAverage)
        
        movieAverage.translatesAutoresizingMaskIntoConstraints = false
        movieAverage.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 10).isActive = true
        movieAverage.centerYAnchor.constraint(equalTo: starImage.centerYAnchor).isActive = true
        movieAverage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let imdbMaxLabel = UILabel()
        imdbMaxLabel.text = "/10"
        imdbMaxLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        imdbMaxLabel.adjustsFontForContentSizeCategory = true
        
        addSubview(imdbMaxLabel)
        
        imdbMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        imdbMaxLabel.leadingAnchor.constraint(equalTo: movieAverage.trailingAnchor).isActive = true
        imdbMaxLabel.bottomAnchor.constraint(equalTo: movieAverage.bottomAnchor).isActive = true
        imdbMaxLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
        movieRelaseDate = UILabel()
        movieRelaseDate.font = UIFont.systemFont(ofSize: 12, weight: .light)
        movieRelaseDate.adjustsFontForContentSizeCategory = true
        
        addSubview(movieRelaseDate)
        
        movieRelaseDate.translatesAutoresizingMaskIntoConstraints = false
        movieRelaseDate.centerXAnchor.constraint(equalTo: relaseDateTitle.centerXAnchor).isActive = true
        movieRelaseDate.centerYAnchor.constraint(equalTo: starImage.centerYAnchor).isActive = true
        
        movieDirector = UILabel()
        movieDirector.font = UIFont.systemFont(ofSize: 12, weight: .light)
        movieDirector.adjustsFontForContentSizeCategory = true
        movieDirector.numberOfLines = 2
        
        addSubview(movieDirector)
        
        movieDirector.translatesAutoresizingMaskIntoConstraints = false
        movieDirector.centerXAnchor.constraint(equalTo: directorTitle.centerXAnchor).isActive = true
        movieDirector.centerYAnchor.constraint(equalTo: starImage.centerYAnchor).isActive = true
        
        movieGenre = UILabel()
        movieGenre.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        movieGenre.adjustsFontForContentSizeCategory = true
        movieGenre.numberOfLines = 2
        
        addSubview(movieGenre)
        
        movieGenre.translatesAutoresizingMaskIntoConstraints = false
        movieGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        movieGenre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        movieGenre.topAnchor.constraint(equalTo: movieAverage.bottomAnchor, constant: 20).isActive = true
        
        movieDescription = UILabel()
        movieDescription.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
        movieDescription.adjustsFontForContentSizeCategory = true
        movieDescription.numberOfLines = .max
        
        addSubview(movieDescription)
        
        movieDescription.translatesAutoresizingMaskIntoConstraints = false
        movieDescription.leadingAnchor.constraint(equalTo: movieGenre.leadingAnchor).isActive = true
        movieDescription.trailingAnchor.constraint(equalTo: movieGenre.trailingAnchor).isActive = true
        movieDescription.topAnchor.constraint(equalTo: movieGenre.bottomAnchor, constant: 15).isActive = true
        
    }
}
