//
//  CGRect+Extensions.swift
//  KeyboardLayoutGuide
//
//  Created by Geri Borbás on 14/04/2022.
//  http://www.twitter.com/Geri_Borbas
//

import CoreGraphics


extension CGSize {
    
    var rect: CGRect {
        .init(origin: .zero, size: self)
    }
}


extension CGRect {
    
    var bottomEdgeRect: CGRect {
        .init(
            x: minX,
            y: maxY,
            width: size.width,
            height: .zero
        )
    }
}
