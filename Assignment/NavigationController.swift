//
//  NavigationController.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)

        let closeBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .done,
            target: self,
            action: #selector(self.popViewController(animated:)))

        viewController.navigationItem.rightBarButtonItem = closeBarButtonItem
        
    }
}
