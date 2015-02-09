//
//  Preview.swift
//  practicam
//
//  Created by ken morobayashi on 2015/01/25.
//  Copyright (c) 2015年 ken morobayashi. All rights reserved.
//

import UIKit

class Preview {
    var baseView:UIView!
    var sizeAdjuster:SizeAdjuster!
    
    init(view:UIView){
        self.baseView = view
        self.sizeAdjuster = SizeAdjuster(view:view)
    }
    
    func close(){
        
        if(self.baseView.viewWithTag(UINoStruct.PREVIEW_BASE) != nil){
            var old: UIVisualEffectView = self.baseView.viewWithTag(UINoStruct.PREVIEW_BASE) as UIVisualEffectView
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.PREVIEW_IMAGE) != nil){
            var old: UIImageView = self.baseView.viewWithTag(UINoStruct.PREVIEW_IMAGE) as UIImageView
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.PREVIEW_CLOSE) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.PREVIEW_CLOSE) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.PREVIEW_FACEBOOK) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.PREVIEW_FACEBOOK) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.PREVIEW_TWITTER) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.PREVIEW_TWITTER) as UIButton
            old.removeFromSuperview()
        }
    }
    
    func createPreview(image:UIImage) {
        // Blurエフェクトを適用するEffectViewを作成
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView : UIVisualEffectView!
        if effectView != nil {
            effectView.removeFromSuperview()
        }
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[28]!)
        effectView.layer.position = CGPoint(x: self.sizeAdjuster.getRateWidth(0.5), y:self.sizeAdjuster.getRateHeight(0.5))
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 20.0
        
        // UIImageViewを作成する.
        let imageView: UIImageView = UIImageView(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[20]!,self.sizeAdjuster.sizeDicHeight[20]!))
        // 画像をUIImageViewに設定する.
        imageView.image = image
        // 画像の表示する座標を指定する.
        imageView.layer.position = CGPoint(x: self.sizeAdjuster.getRateWidth(0.5), y: self.sizeAdjuster.sizeDicHeight[14]!)
        
        ViewHelper.viewHelperInstance.addSubview(self.baseView , effectView:effectView , no:UINoStruct.PREVIEW_BASE)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , image:imageView , no:UINoStruct.PREVIEW_IMAGE)
        
    }
    
    func createCloseButton()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "close.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[26]!, self.sizeAdjuster.sizeDicHeight[26]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.PREVIEW_CLOSE)
        return button
    }
    
    func createFacebookButton()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "facebook.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[8]!, self.sizeAdjuster.sizeDicHeight[26]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.PREVIEW_FACEBOOK)
        return button
    }
    
    func createTwitterButton()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "twitter.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[12]!, self.sizeAdjuster.sizeDicHeight[26]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.PREVIEW_TWITTER)
        return button
    }
}