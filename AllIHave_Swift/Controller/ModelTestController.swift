//
//  ModelTestController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/11/2.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit
import SwiftyJSON

class ModelTestController: UIViewController {

    var testDic:NSDictionary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testDic = ["name":"Bob",
                   "id":"6666",
                   "phonenumber":"18888888888",
                   "qq":"888888",
                   "email":"888888@qq.com",
                   "address":"广东深圳"]
        
        let userModel = UserInfo()
        userModel.parseData(dic: testDic!)
        print(userModel.name,userModel.phonenumber)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
