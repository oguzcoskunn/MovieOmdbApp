//
//  MovieDetailViewController.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 21.01.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var sView = MovieDetailView()
    let service = Service()
    var movieId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = sView
        viewConfigure()
    }
    
    func viewConfigure() {
        sView.movieGenre.text = ""
        sView.movieDescription.text = ""
        sView.movieAverage.text = "?"
        sView.movieRelaseDate.text = "Unknown"
        sView.movieDirector.text = "Unknown"
        
        service.delegate = self
        
        sView.topBar.backArrowButton.addTarget(self, action: #selector(backArrowButtonTapped), for: .touchUpInside)
        sView.loadingSpinner.startAnimating()
        service.getMovies(with: movieId ?? "") { movie in
            self.sView.loadingSpinner.stopAnimating()
            self.configure(moviesData: movie)
        }

        
    }
    
    func configure(moviesData: MoviesData) {
        if moviesData.Genre != Keywords.notFound {
            sView.movieGenre.text = moviesData.Genre
        }
        
        if moviesData.Plot != Keywords.notFound {
            sView.movieDescription.text = moviesData.Plot
        }

        if moviesData.imdbRating != Keywords.notFound {
            sView.movieAverage.text = moviesData.imdbRating
        }

        if moviesData.Released != Keywords.notFound {
            sView.movieRelaseDate.text = moviesData.Released
        }
        
        if moviesData.Director != Keywords.notFound {
            sView.movieDirector.text = moviesData.Director
        }
        
        if moviesData.Poster != Keywords.notFound {
            DispatchQueue.main.async {
                Helper.shared.setImage(with: (moviesData.Poster ?? ""), with: self.sView.movieImageView, with: 15)
            }
        } else {
            self.sView.movieImageView.image = UIImage(named: "notFound")
        }
    }
    
    @objc func backArrowButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - ServiceDelegate
extension MovieDetailViewController: ServiceDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
