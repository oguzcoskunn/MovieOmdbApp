//
//  NavigationBarView.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 21.01.2023.
//

import UIKit

public class NavigationBarView: UIView {
    
    var titleLabel: UILabel!
    var backArrowButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "navigationBarColor") 
        buildNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func buildNavigationBar() {
        backArrowButton = UIButton()
        
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 22, weight: .bold, scale: .large)
        let image = UIImage(systemName: "arrow.left", withConfiguration: imageConfiguration)
        backArrowButton.setImage(image, for: .normal)
        
        backArrowButton.tintColor = .white
        addSubview(backArrowButton)
        backArrowButton.translatesAutoresizingMaskIntoConstraints = false
        backArrowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        backArrowButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backArrowButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
    }
    
}
