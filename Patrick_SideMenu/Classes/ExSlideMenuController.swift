//
//  ExSlideMenuController.swift
//  Patrick_SideMenu
//
//  Created by Pratik on 4/10/18.
//  Copyright © 2018 Pratik. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ExSlideMenuController : SlideMenuController {
    //NSG
    //    override func isTagetViewController() -> Bool {
    //        if let vc = UIApplication.topViewController() {
    //            if vc is MenuVC || vc is SettingVC {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    //
    //    override func track(_ trackAction: TrackAction) {
    //        switch trackAction {
    //        case .leftTapOpen:
    //            print("TrackAction: left tap open.")
    //        case .leftTapClose:
    //            print("TrackAction: left tap close.")
    //        case .leftFlickOpen:
    //            print("TrackAction: left flick open.")
    //        case .leftFlickClose:
    //            print("TrackAction: left flick close.")
    //        case .rightTapOpen:
    //            print("TrackAction: right tap open.")
    //        case .rightTapClose:
    //            print("TrackAction: right tap close.")
    //        case .rightFlickOpen:
    //            print("TrackAction: right flick open.")
    //        case .rightFlickClose:
    //            print("TrackAction: right flick close.")
    //        }
    //    }
}
//
//extension UIApplication {
//
//    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let nav = viewController as? UINavigationController {
//            return topViewController(nav.visibleViewController)
//        }
//        if let tab = viewController as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return topViewController(selected)
//            }
//        }
//        if let presented = viewController?.presentedViewController {
//            return topViewController(presented)
//        }
//
//        if let slide = viewController as? SlideMenuController {
//            return topViewController(slide.mainViewController)
//        }
//        return viewController
//    }
//}


