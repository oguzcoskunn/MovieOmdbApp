//
//  HomeViewController.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 18.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    var sView = HomeView()
    let service = Service()
    var moviesSearchDataList: MoviesSearchData?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view = sView
        configure()
    }
    
    func configure() {
        service.delegate = self
        sView.filmListCV.dataSource = self
        sView.filmListCV.delegate = self
        sView.filmListCV.collectionViewLayout = UICollectionViewFlowLayout()
        sView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        sView.doneButton.action = #selector(doneButtonAction)
        sView.doneButton.target = self
    }
    
    @objc func searchButtonTapped() {
        let searchText = sView.searchTextField.text ?? ""
        getMovies(searchText)
    }

    func getMovies(_ title: String) {
        DispatchQueue.main.async {
            self.moviesSearchDataList = nil
            self.sView.filmListCV.reloadData()
            self.sView.loadingSpinner.startAnimating()
            
            self.service.getSearchMovies(with: title) { movieSearch in
                if let movieSearch {
                    self.moviesSearchDataList = movieSearch
                    
                    if self.moviesSearchDataList?.Search?.count ?? 0 > 0 {
                        self.sView.filmListCV.reloadData()
                    } else {
                        let alert = UIAlertController(title: "Error", message: "The movie you searched is not found!", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                self.sView.loadingSpinner.stopAnimating()
            }
        }
    }
    
    @objc func doneButtonAction(){
        sView.searchTextField.endEditing(true)
    }
}

