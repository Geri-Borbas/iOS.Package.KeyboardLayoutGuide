//
//  UIApplication+Extensions.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 14/04/2022.
//  http://www.twitter.com/Geri_Borbas
//

import Foundation
import UIKit


extension UIApplication {
    
    static var firstWindow: UIWindow? {
        if #available(iOS 15.0, *) {
            return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
        } else {
            return UIApplication.shared.windows.first
        }
    }
}
