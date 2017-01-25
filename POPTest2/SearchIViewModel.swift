//
//  SearchIViewModel.swift
//  POPTest2
//
//  Created by screson on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

struct AppItem {
    let name: String
    let downloadUrl: String
    let iconUrl: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        guard let name = obj?["name"] as? String else {
            return nil
        }
        guard let message = obj?["message"] as? String else {
            return nil
        }
        self.name = name
        self.downloadUrl = message
        self.iconUrl = message
    }
}

extension AppItem: Decodable {
    static func parse(data: Data) -> AppItem? {
        return AppItem(data:data)
    }
}

struct AppListRequest:Request {
    internal var parameter: [String : Any]?

    var path: String {
        return "/search"
    }
    let method: HTTPMethod = .GET
    typealias Response = AppItem
    
    func parse(data: Data) -> AppItem? {
        return AppItem(data: data)
    }
}

