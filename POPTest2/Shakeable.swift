//
//  Shakeable.swift
//  POPTest2
//
//  Created by JuanFelix on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

protocol Shakeable {
    
}

extension Shakeable where Self: UIView{
    func shake() {
        let animation           = CABasicAnimation(keyPath: "position")
        animation.duration      = 0.05
        animation.repeatCount   = 5
        animation.fromValue     = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
        animation.toValue       = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
        animation.autoreverses  = true
        layer.add(animation, forKey: "shake")
    }
}
