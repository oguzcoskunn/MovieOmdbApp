//
//  FilmListView.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 18.01.2023.
//

import UIKit

public class HomeView: UIView {
    
    var filmListCV: UICollectionView!
    let searchTextField = UITextField()
    let searchButton = UIButton()
    let loadingSpinner = UIActivityIndicatorView()
    var topBar = NavigationBarView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        buildNavigationBar()
        buildSearchBar()
        buildFilmListCV()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func buildNavigationBar() {
        topBar.titleLabel.text = "Cinema"
        topBar.backArrowButton.isHidden = true
        
        addSubview(topBar)
        topBar.titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func buildSearchBar() {
        
        searchTextField.placeholder = "Movie name..."
        searchTextField.borderStyle = .roundedRect
        addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        searchTextField.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 20).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.backgroundColor = UIColor.systemBlue
        
        searchButton.layer.cornerRadius = 5
        addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    private func buildFilmListCV() {
        addSubview(loadingSpinner)
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingSpinner.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 25).isActive = true
        
        filmListCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        filmListCV.showsVerticalScrollIndicator = false
        filmListCV.showsHorizontalScrollIndicator = false
        filmListCV.backgroundColor = .clear
        filmListCV.register(MovieCell.self, forCellWithReuseIdentifier: CellIdentifier.movieCellIdentifier)
        
        addSubview(filmListCV)
        
        filmListCV.translatesAutoresizingMaskIntoConstraints = false
        filmListCV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        filmListCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        filmListCV.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 25).isActive = true
        filmListCV.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: 10).isActive = true
    }
    
}
