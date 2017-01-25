//
//  ViewController.swift
//  POPTest2
//
//  Created by JuanFelix on 2017/1/25.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXUIImageView: UIImageView,Shakeable {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

class ZXButton: UIButton,Shakeable {
    
}

class ZXTableViewCell: UITableViewCell {
    
}

extension UITableViewCell:ResuableView, NibLoadableView {}

class ViewController: UIViewController {
    let shakeView = ZXUIImageView()
    let button = ZXButton(type: .contactAdd)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shakeView.backgroundColor = UIColor.green
        shakeView.center = view.center
        view.addSubview(shakeView)

        button.backgroundColor = UIColor.clear
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.center = CGPoint(x: view.center.x, y: view.center.y - 160)
        button.setTitle("Test", for: .normal)
        view.addSubview(button)
        URLSessionClient().send(AppListRequest(parameter: ["term":"Apple","limit":(30),"entity":"software"])) { (user) in
            if let user = user {
                print("\(user.iconUrl) from \(user.name)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        shakeView.shake()
        button.shake()
        print("reId:\(ZXTableViewCell.reuseIdentifier)")
        print("nib:\(UINib(nibName: ZXTableViewCell.NibName, bundle: nil))")
    }
}



