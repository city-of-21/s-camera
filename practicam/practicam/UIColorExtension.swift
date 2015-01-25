//
//  UIColorExtension.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/11/29.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func getColor (var hexStr : NSString,var alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            return UIColor.whiteColor();
        }
    }
    
    class func setGradientLayer (label:UILabel,colors:[UIColor]){
        let gradient : CAGradientLayer = CAGradientLayer()
        var arrayColors = [AnyObject]()
        for(var i = 0; i < colors.count; i++){
            arrayColors.append(colors[i].CGColor)
        }
        gradient.frame = label.bounds
        gradient.colors = arrayColors
        ViewHelper.viewHelperInstance.addSubLayer(label , gradientLayer: gradient , key:UINoStruct.GRID_GRADIENT_LAYER)
    }
}
