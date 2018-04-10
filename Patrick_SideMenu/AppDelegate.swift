//
//  AppDelegate.swift
//  Patrick_SideMenu
//
//  Created by Pratik on 3/7/18.
//  Copyright © 2018 Pratik. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isSideMenuFullScreen : Bool = false                 // For Left Menu FullScreen Or Under Navigation Bar
    
    class var shared:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        LLocalizer.doBaseInternationalization()
        
        //Set Left Menu & Home VC
        mainScreenNavigation()
        
        return true
    }
    
    func mainScreenNavigation() {
        
        // create viewController code...
        let mainViewController = PageMenuVC.viewController(storyboard:"Main") as! PageMenuVC
        let leftViewController = LeftMenuVC.viewController(storyboard:"Main") as! LeftMenuVC
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        nvc.isNavigationBarHidden = true;
        
        isSideMenuFullScreen = false
        
        var navigationHeightWithStatusBar : CGFloat = 0.0
        
        if isSideMenuFullScreen
        {
            navigationHeightWithStatusBar = 0
        }else{
            navigationHeightWithStatusBar = UIApplication.shared.statusBarFrame.height + mainViewController.navigationController!.navigationBar.frame.height
        }

        let screenBounds = UIScreen.main.bounds
        let width = screenBounds.width
        let height = screenBounds.height
        
        
        SlideMenuOptions.contentViewScale = 1.0
        SlideMenuOptions.contentViewOpacity = 0.5
        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.leftViewWidth = width * 0.8
        SlideMenuOptions.rightViewWidth = 300
        
        var slideMenuController:SlideMenuController!
        if LLanguage.isRTL == true{
            slideMenuController = SlideMenuController(mainViewController:nvc, rightMenuViewController: leftViewController)
        }
        else{
            slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        }

//        slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)

        
        //        SlideMenuOptions.opacityOffset = navigationHeightWithStatusBar
        var opacityViewFrame = slideMenuController.opacityView.frame
        opacityViewFrame.origin.y = opacityViewFrame.origin.y + navigationHeightWithStatusBar
        slideMenuController.opacityView.frame = opacityViewFrame
        //
//                SlideMenuOptions.leftOffset = navigationHeightWithStatusBar
        if LLanguage.isRTL == true{
            var leftContainerViewFrame = slideMenuController.rightContainerView.frame
            leftContainerViewFrame.origin.y = leftContainerViewFrame.origin.y + navigationHeightWithStatusBar
            leftContainerViewFrame.size.height = slideMenuController.rightContainerView.frame.size.height - leftContainerViewFrame.origin.y
            slideMenuController.rightContainerView.frame = leftContainerViewFrame
        }else{
            var leftContainerViewFrame = slideMenuController.leftContainerView.frame
            leftContainerViewFrame.origin.y = leftContainerViewFrame.origin.y + navigationHeightWithStatusBar
            leftContainerViewFrame.size.height = slideMenuController.leftContainerView.frame.size.height - leftContainerViewFrame.origin.y
            slideMenuController.leftContainerView.frame = leftContainerViewFrame
        }
        
//        var leftContainerViewFrame = slideMenuController.leftContainerView.frame
//        leftContainerViewFrame.origin.y = leftContainerViewFrame.origin.y + navigationHeightWithStatusBar
//        leftContainerViewFrame.size.height = slideMenuController.leftContainerView.frame.size.height - leftContainerViewFrame.origin.y
//        slideMenuController.leftContainerView.frame = leftContainerViewFrame

        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController 
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
    }
    
    
    func didLoadingFinishedAfterAppLaunch() {
        
        AppDelegate.shared.mainScreenNavigation()
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}


extension UIViewController {
    
    class func viewController(identifier strClass:String, storyboard storyboardName:String) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: strClass)
        
        return viewController
    }
    
    class func viewController(storyboard storyboardName: String) -> UIViewController {
        
        var strClass: String =  NSStringFromClass(self)
        let module = strClass.components(separatedBy: ".")
        if module.count>1{
            strClass = module[1]
        }
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: strClass)
        
        return viewController
    }
    
    class func viewControllerMainStoryboard() -> UIViewController {
        return UIViewController.viewController(storyboard:"Main")
    }
    
}
