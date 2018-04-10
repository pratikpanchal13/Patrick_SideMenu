//
//  UIViewController+Extended.swift
//  Patrick_SideMenu
//
//  Created by Pratik on 4/10/18.
//  Copyright © 2018 Pratik. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        navigationController?.navigationBar.isTranslucent = true

        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
    
}
