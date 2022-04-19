//
//  UIView+OnSafeAreaInsetsDidChange.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 15/04/2022.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit
import SwiftUI


extension UIView {
    
    typealias Action = () -> Void
    
    var onSafeAreaInsetsDidChange: Action? {
        get {
            associatedObject(for: "onSafeAreaInsetsDidChange") as? Action
        }
        set {
            Self.swizzleSafeAreaInsetsDidChangeIfNeeded()
            set(associatedObject: newValue, for: "onSafeAreaInsetsDidChange")
        }
    }
    
    static var swizzled = false
    
    static func swizzleSafeAreaInsetsDidChangeIfNeeded() {
        guard swizzled == false else { return }
        swizzle(
            method: "safeAreaInsetsDidChange",
            originalSelector: #selector(originalSafeAreaInsetsDidChange),
            swizzledSelector: #selector(swizzledSafeAreaInsetsDidChange),
            for: Self.self
        )
        swizzled = true
    }
    
    @objc func originalSafeAreaInsetsDidChange() {
        // Original implementaion will be copied here.
    }
    
    @objc func swizzledSafeAreaInsetsDidChange() {
        originalSafeAreaInsetsDidChange()
        onSafeAreaInsetsDidChange?()
    }
}
