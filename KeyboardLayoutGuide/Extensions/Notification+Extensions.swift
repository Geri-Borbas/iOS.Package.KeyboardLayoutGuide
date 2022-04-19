//
//  Notification+Extensions.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 14/04/2022.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


extension Notification {
    
    var keyboardFrameBegin: CGRect {
        if let userInfo = self.userInfo,
           let value = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            return value.cgRectValue
        } else {
            return CGRect.zero
        }
    }
    
    var keyboardFrameEnd: CGRect {
        if let userInfo = self.userInfo,
           let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            return value.cgRectValue
        } else {
            return CGRect.zero
        }
    }
    
    var animationDuration: Double {
        if let userInfo = self.userInfo,
           let value = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber {
            return value.doubleValue
        } else {
            return 0
        }
    }
    
    var animationCurveOptions: UIView.AnimationOptions {
        if let userInfo = self.userInfo,
           let value = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
            return UIView.AnimationOptions(rawValue: value.uintValue << 16)
        } else {
            return []
        }
    }
}
