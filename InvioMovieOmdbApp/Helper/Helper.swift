//
//  Helper.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 18.01.2023.
//

import UIKit
import Kingfisher

struct Helper {
    
    static let shared = Helper()
    
    //MARK: - Set ImageView
    func setImage(with imageLink: String, with imageView: UIImageView) {
        let url = URL(string: imageLink)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
                     
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    //MARK: - Set ImageView with Corner Radius
    func setImage(with imageLink: String, with imageView: UIImageView, with cornerRadius: CGFloat) {
        let url = URL(string: imageLink)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
