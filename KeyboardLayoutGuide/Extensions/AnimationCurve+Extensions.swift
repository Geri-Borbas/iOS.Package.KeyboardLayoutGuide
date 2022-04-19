//
//  AnimationCurve+Extensions.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 14/04/2022.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


extension UIView.AnimationCurve {
    
    var animationOption: UIView.AnimationOptions {
        switch self {
        case .easeInOut:
            return .curveEaseInOut
        case .easeIn:
            return .curveEaseIn
        case .easeOut:
            return .curveEaseOut
        case .linear:
            return .curveLinear
        @unknown default:
            return .curveLinear
        }
    }
}
