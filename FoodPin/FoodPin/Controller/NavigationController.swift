//
//  NavigationController.swift
//  FoodPin
//
//  Created by Simon Ng on 29/10/2020.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
