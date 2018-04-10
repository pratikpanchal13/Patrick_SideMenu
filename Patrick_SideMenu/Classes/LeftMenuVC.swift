//
//  LeftMenuVC.swift
//  Patrick_SideMenu
//
//  Created by Pratik on 3/7/18.
//  Copyright © 2018 Pratik. All rights reserved.
//

import UIKit

enum LeftMenuEnum: Int {
    case resetMpin = 0
    case changeMPin
    case helpInfo
    case notification
    case logout
    case myAccount
    case setting
    case language
    case passwordPolicy
    case terms
    case privacyPolicy
    case manageProfile
    case faq
    case assistantReport
}


class LeftMenuVC: UIViewController {

    var tableData = [[String:Any]]()

    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableData.removeAll()
        tableData = [["id": LeftMenuEnum.manageProfile,"name":"Manage_Profile","image":""]]
        tableData.append(["id": LeftMenuEnum.resetMpin,"name":"Reset_MPIN","image":""])
        tableData.append(["id": LeftMenuEnum.changeMPin,"name":"Change_MPIN","image":""])
        tableData.append(["id": LeftMenuEnum.helpInfo,"name":"Helpline_Info","image":""])
        tableData.append(["id": LeftMenuEnum.notification,"name":"Notification","image":""])
        tableData.append(["id": LeftMenuEnum.faq,"name":"FAQ","image":""])
        tableData.append(["id": LeftMenuEnum.language,"name":"Change","image":""])
        tableData.append(["id": LeftMenuEnum.setting,"name":"Settings","image":""])
        tableData.append(["id": LeftMenuEnum.passwordPolicy,"name":"Password_Policy","image":""])
        tableData.append(["id": LeftMenuEnum.terms,"name":"Terms__Conditions","image":""])
        tableData.append(["id": LeftMenuEnum.privacyPolicy,"name":"Privacy_Policy","image":""])
        tableData.append(["id": LeftMenuEnum.logout,"name":"Log_Out","image":""])
        
        myTableView.reloadData()
        myTableView.tableFooterView = UIView(frame: .zero)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LeftMenuVC
{
    func changeViewController(_ menu: LeftMenuEnum) {
        
        let nvc = self.slideMenuController()?.mainViewController as! UINavigationController
        if LLanguage.isRTL == true{
            self.slideMenuController()?.closeRight()
        }
        else{
            self.slideMenuController()?.closeLeft()
        }

//        self.slideMenuController()?.closeLeft()

        switch menu {
        case .manageProfile:
            
            let subContentsVC = ProfileVC.viewController(storyboard:"Main") as! ProfileVC
            nvc.pushViewController(subContentsVC, animated: true)

            
        case .resetMpin:
            
            let subContentsVC = SettingVC.viewController(storyboard:"Main") as! SettingVC
            nvc.pushViewController(subContentsVC, animated: true)
            
        case .myAccount: break
        case .setting:
            
//            let subContentsVC = SettingVC.viewController(storyboard:"Main") as! SettingVC

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let swiftViewController = storyboard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            let SettingVCq : UIViewController  = UINavigationController(rootViewController: swiftViewController)
            
            

            self.slideMenuController()?.changeMainViewController(SettingVCq, close: true)

            
          break
            
        case .language:
            print("Language")
            self.showLangaugaeActionSheet()
            
        case .helpInfo:
            break
            
        case .notification:
            break
        case .logout:
            break
        case .passwordPolicy:
            break
        case .terms:
            break
        case .privacyPolicy:
            break
        case .faq:
            break
        case .assistantReport:
            break
        case .changeMPin:
            break
        }
    }
}

extension LeftMenuVC{
    func showLangaugaeActionSheet()  {
        
        let languageAlert = UIAlertController(title: "Choose Language", message: "", preferredStyle: .actionSheet)
        
        languageAlert.addAction(UIAlertAction(title: "English", style: .default, handler: { (alert) in
            LLanguage.appleLanguage = LanguageIdEnum.english.rawValue
            LLanguage.updateViewSemanticContentAttribute()
            AppDelegate.shared.didLoadingFinishedAfterAppLaunch()

            
        }))
        languageAlert.addAction(UIAlertAction(title: "Español", style: .default, handler: { (alert) in
            LLanguage.appleLanguage = LanguageIdEnum.spanish.rawValue
            LLanguage.updateViewSemanticContentAttribute()
            AppDelegate.shared.didLoadingFinishedAfterAppLaunch()

        }))
        languageAlert.addAction(UIAlertAction(title: "Français", style: .default, handler: { (alert) in
            LLanguage.appleLanguage = LanguageIdEnum.french.rawValue
            LLanguage.updateViewSemanticContentAttribute()
            AppDelegate.shared.didLoadingFinishedAfterAppLaunch()

        }))
        languageAlert.addAction(UIAlertAction(title: "Arabic", style: .default, handler: { (alert) in
            LLanguage.appleLanguage = LanguageIdEnum.arabic.rawValue
            LLanguage.updateViewSemanticContentAttribute()
            AppDelegate.shared.didLoadingFinishedAfterAppLaunch()


        }))
        
        languageAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let nvc = self.slideMenuController()?.mainViewController as! UINavigationController
        nvc.present(languageAlert, animated: true, completion: nil)
    }
}

extension LeftMenuVC : UITableViewDelegate,UITableViewDataSource{
    // MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CELL")
        }
        
        let data = tableData[indexPath.row]
        cell?.selectionStyle = .none;
        
        if let myString =  data["name"] as? String{
            cell?.textLabel?.text = myString
        }
        
        return cell!
    }
    
    // MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let data = tableData[indexPath.row]
        let selected = data["id"] as? LeftMenuEnum
        //NSG
        if let menu = selected {
            self.changeViewController(menu)
        }
    }
}
