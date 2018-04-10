//
//  Languages.swift
//  Patrick_SideMenu
//
//  Created by Pratik on 4/10/18.
//  Copyright © 2018 Pratik. All rights reserved.
//

import Foundation


extension String {
    
    var localized: String {
        return  NSLocalizedString(self, comment: "") //Languages.LocStr(self)//
    }
}

struct Languages{ //Always create class with nsobject if you want to acesss in objective c code//class Languages:NSObject{
    static var Name:String {return "Name".localized}
    static var Number:String {return "Number".localized}
}

