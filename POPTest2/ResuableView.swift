//
//  ResuableView.swift
//  POPTest2
//
//  Created by JuanFelix on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

protocol ResuableView: class {}

extension ResuableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}


protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing:self)
    }
}
