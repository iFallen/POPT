//
//  Request.swift
//  POPTest2
//
//  Created by JuanFelix on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any]? { get }
    
    associatedtype Response: Decodable
}



