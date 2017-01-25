//
//  Decodable.swift
//  POPTest2
//
//  Created by JuanFelix on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import Foundation

protocol Decodable {
    static func parse(data: Data) -> Self?
}
