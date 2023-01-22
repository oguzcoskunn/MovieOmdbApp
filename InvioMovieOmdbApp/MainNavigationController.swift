//
//  NavigationController.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 19.01.2023.
//

import UIKit

public final class MainNavigationController: UINavigationController {

    var interfaceOrientations: UIInterfaceOrientationMask?
    var statusBarStyle: UIStatusBarStyle?
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        if let style = statusBarStyle {
            return style
        }
        return viewControllers.last?.preferredStatusBarStyle ?? .default
    }
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let orientations = interfaceOrientations {
            return orientations
        }
        return .portrait
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
    }
}
