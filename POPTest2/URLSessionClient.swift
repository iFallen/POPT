//
//  Client.swift
//  POPTest2
//
//  Created by JuanFelix on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

struct URLSessionClient: Client {
    let host = "https://itunes.apple.com"
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
//        if (r.parameter != nil) {
//            let data = NSDate.init(
//        }
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            }else{
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}
