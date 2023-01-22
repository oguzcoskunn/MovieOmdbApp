//
//  HomeViewController_CV_Ext.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 18.01.2023.
//

import UIKit


//MARK: - ServiceDelegate
extension HomeViewController: ServiceDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesSearchDataList?.Search?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sView.filmListCV.dequeueReusableCell(withReuseIdentifier: CellIdentifier.movieCellIdentifier, for: indexPath) as! MovieCell
        
        var imageLink = ""
        var title = ""
        var year = ""
        
        if let linkImage = moviesSearchDataList?.Search?[indexPath.row].Poster {
            imageLink = linkImage
        }
        
        if let movieTitle = moviesSearchDataList?.Search?[indexPath.row].Title {
            title = movieTitle
        }
        
        if let movieYear = moviesSearchDataList?.Search?[indexPath.row].Year {
            year = movieYear
        }
        
        if imageLink != Keywords.notFound {
            DispatchQueue.main.async {
                Helper.shared.setImage(with: imageLink, with: cell.movieImageView)
            }
            
        } else {
            cell.movieImageView.image = UIImage(named: "notFound")
        }
        cell.movieTitle.text = title
        cell.movieYear.text = year
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        if let movieId = moviesSearchDataList?.Search?[indexPath.row].imdbID {
            movieDetailVC.movieId = movieId
            movieDetailVC.sView.topBar.titleLabel.text = moviesSearchDataList?.Search?[indexPath.row].Title
            movieDetailVC.sView.topBar.heightAnchor.constraint(equalToConstant: sView.topBar.bounds.height).isActive = true
            navigationController?.pushViewController(movieDetailVC, animated: true)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 160)
    }
}


