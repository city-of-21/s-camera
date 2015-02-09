//
//  MenuView.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/11/16.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.
//

import UIKit

class MenuView {
    var baseView:UIView!
    var sizeAdjuster:SizeAdjuster!
    
    init(view:UIView){
        self.baseView = view
        self.sizeAdjuster = SizeAdjuster(view:view)
    }
    func createViewEffectBlur() {
        // Blurエフェクトを適用するEffectViewを作成
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView : UIVisualEffectView!
        if effectView != nil {
            effectView.removeFromSuperview()
        }
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, self.baseView.bounds.width, self.sizeAdjuster.sizeDicHeight[3]!)
        effectView.layer.position = CGPoint(x: self.sizeAdjuster.getRateWidth(0.5), y:self.sizeAdjuster.sizeDicHeight[30]!)
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 20.0
        
        ViewHelper.viewHelperInstance.addSubview(self.baseView , effectView:effectView , no:UINoStruct.VIEW_EFFECT_BLUR)
    }
    
    func createCameraButton()->UIButton {
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[6]!,self.sizeAdjuster.sizeDicHeight[3]!))
        button.layer.position = CGPoint(x: self.sizeAdjuster.getRateWidth(0.5), y:self.sizeAdjuster.sizeDicHeight[30]!)
        
        let image = UIImage(named: "cam.png")
        button.setImage(image, forState: .Normal)
        
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.BUTTON_CAMERA)
        
        return button
    }
    
    func createCameraChangeButton()->UIButton {
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[6]!,self.sizeAdjuster.sizeDicHeight[3]!))
        button.layer.position = CGPoint(x: self.sizeAdjuster.getRateWidth(0.25), y:self.sizeAdjuster.sizeDicHeight[30]!)
        
        let image = UIImage(named: "camc.png")
        button.setImage(image, forState: .Normal)
        
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.BUTTON_CAMERA_CHANGE)
        return button
    }
    
    func createGridButton()->UIButton {
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[6]!,self.sizeAdjuster.sizeDicHeight[3]!))
        button.layer.position = CGPoint(x: self.sizeAdjuster.getRateWidth(0.75), y:self.sizeAdjuster.sizeDicHeight[30]!)
        let image = UIImage(named: "camg.png")
        button.setImage(image, forState: .Normal)
        
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.BUTTON_GRID)
        return button
    }
    
}