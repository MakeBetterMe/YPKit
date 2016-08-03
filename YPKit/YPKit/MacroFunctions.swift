//
//  MacroFunctions.swift
//  WowLib
//
//  Created by 王云鹏 on 16/3/17.
//  Copyright © 2016年 wowdsgn. All rights reserved.
//

import Foundation
import UIKit

public func MGRgb(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1) -> UIColor{
    return UIColor(red:r/255.0, green: g/255.0, blue: b/255.0, alpha:alpha)
}



public func kkLog(){
    debugPrint("123")
}


public func MGFrame(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect{
    return CGRectMake(x, y, width, height)
}

public func MGNib(nibName:String) ->UINib{
    return UINib(nibName:nibName, bundle: NSBundle.mainBundle())
}

public let MGScreenWidth:CGFloat = UIScreen.mainScreen().bounds.size.width
public let MGScreenHeight:CGFloat = UIScreen.mainScreen().bounds.size.height

//MARK:简写的实例化
public let MGDefault = NSUserDefaults.standardUserDefaults()
public let MGNotificationCenter = NSNotificationCenter.defaultCenter()


//MARK:流水线加工控件

/**
流水线label
居中 背景白色label
- returns: 居中 背景白色label 14号字体 字体颜色60，60，60  单行
*/
public func MGfactoryLabel() -> UILabel{
    let label = UILabel()
    label.textAlignment = .Center
    label.backgroundColor = UIColor.whiteColor()
    label.font = UIFont.systemFontOfSize(14)
    label.numberOfLines = 1
    label.textColor = MGRgb(60, g: 60, b: 60)
    return label
}

/**
 流水线View
 背景白色
 */
public func MGfactoryView() -> UIView{
    let view = UIView()
    view.backgroundColor = UIColor.whiteColor()
    return view
}

public func MGFactoryButton() ->UIButton{
    let view = UIButton()
    return view
}

/**
 字典 or  数组 转换json字符串
 
 - parameter value:
 - parameter prettyPrinted:
 
 - returns: 
 */
func JSONStringify(value: AnyObject,prettyPrinted:Bool = false) -> String{
    let options = prettyPrinted ? NSJSONWritingOptions.PrettyPrinted : NSJSONWritingOptions(rawValue: 0)
    if NSJSONSerialization.isValidJSONObject(value) {
        
        do{
            let data = try NSJSONSerialization.dataWithJSONObject(value, options: options)
            if let string = NSString(data: data, encoding: NSUTF8StringEncoding) {
                return string as String
            }
        }catch {
            print("error")
            
        }
        
    }
    return ""
}



