//
//  NSObjectExtension.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/11/2.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit
import SwiftyJSON

extension NSObject {
    
    /** 只支持属性全部是 string 类型的模型,当某个属性是 NSDictionary 或者 Array 时, json[key].stringValue 会崩溃 */
    func parseData(json:JSON) {
        
        let dic = json.dictionaryValue as NSDictionary
        let keyArr:Array<String> = dic.allKeys as! Array<String>
        var propertyArr:Array<String> = []
        let hMirror = Mirror(reflecting: self)
        for case let (label?, _) in hMirror.children {
            propertyArr.append(label)
        }
        for property in propertyArr {
            for key in keyArr {
                if key == property {
                    self.setValue(json[key].stringValue, forKey: key)
                }
            }
        }
    }
    
    /** 支持任意类型 */
    func parseData(dic:NSDictionary) {
        
        let keyArr:Array<String> = dic.allKeys as! Array<String>
        var propertyArr:Array<String> = []
        let hMirror = Mirror(reflecting: self)
        for case let (label?, _) in hMirror.children {
            propertyArr.append(label)
        }
        for property in propertyArr {
            for key in keyArr {
                if key == property {
                    self.setValue(dic[key], forKey: key)
                }
            }
        }
    }
    
}
