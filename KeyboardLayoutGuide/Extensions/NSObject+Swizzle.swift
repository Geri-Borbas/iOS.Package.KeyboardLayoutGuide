//
//  NSObject+Swizzle.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 15/04/2022.
//

import Foundation


extension NSObject {
    
    static func swizzle(
        method methodName: String,
        originalSelector: Selector,
        swizzledSelector: Selector,
        for `class`: AnyClass
    ) {
        let selector = Selector(methodName)
        guard let method = class_getInstanceMethod(`class`, selector) else {
            return print("Could not get `\(methodName)` selector.")
        }
        
        guard let originalMethod = class_getInstanceMethod(`class`, originalSelector) else {
            return print("Could not get original selector.")
        }
        
        guard let swizzledMethod = class_getInstanceMethod(`class`, swizzledSelector) else {
            return print("Could not get swizzled selector.")
        }
        
        // Swap implementations.
        method_exchangeImplementations(method, originalMethod)
        method_exchangeImplementations(method, swizzledMethod)
    }
}
