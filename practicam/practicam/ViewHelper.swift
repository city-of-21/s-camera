//
//  ViewHelper.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/11/26.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewHelper {
    
    class var viewHelperInstance:ViewHelper {
        struct Static {
            static let instance:ViewHelper = ViewHelper()
        }
        return Static.instance
    }
    
    func addSubview(view:UIView,effectView:UIVisualEffectView,no:Int) {
        
        if(view.viewWithTag(no) != nil){
            var oldEffectView: UIVisualEffectView = view.viewWithTag(no) as UIVisualEffectView
            oldEffectView.removeFromSuperview()
        }
        effectView.tag = no
        effectView.layer.zPosition = CGFloat(no)
        view.addSubview(effectView)
    }
    
    func addSubview(view:UIView,label:UILabel,no:Int) {
        
        if(view.viewWithTag(no) != nil){
            var oldLabel: UILabel = view.viewWithTag(no) as UILabel
            oldLabel.removeFromSuperview()
        }
        label.tag = no
        label.layer.zPosition = CGFloat(no)
        view.addSubview(label)
    }
    
    func addSubview(view:UIView,button:UIButton,no:Int) {
        
        if(view.viewWithTag(no) != nil){
            var oldButton: UIButton = view.viewWithTag(no) as UIButton
            oldButton.removeFromSuperview()
        }
        button.tag = no
        button.layer.zPosition = CGFloat(no)
        view.addSubview(button)
    }
    
    func addSubview(view:UIView,text:UITextView,no:Int) {
        
        if(view.viewWithTag(no) != nil){
            var oldText: UITextView = view.viewWithTag(no) as UITextView
            oldText.removeFromSuperview()
        }
        text.tag = no
        text.layer.zPosition = CGFloat(no)
        view.addSubview(text)
    }
    
    func addSubview(view:UIView,image:UIImageView,no:Int) {
        
        if(view.viewWithTag(no) != nil){
            var oldImage: UIImageView = view.viewWithTag(no) as UIImageView
            oldImage.removeFromSuperview()
        }
        image.tag = no
        image.layer.zPosition = CGFloat(no)
        view.addSubview(image)
    }
    
    func addSubLayer(view:UIView,avCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer,key:String) {
        
        if(view.layer.valueForKey(key) != nil){
            var oldAvCaptureVideoPreviewLayer: AVCaptureVideoPreviewLayer = view.layer.valueForKey(key) as AVCaptureVideoPreviewLayer
            oldAvCaptureVideoPreviewLayer.removeFromSuperlayer()
        }
        view.layer.setValue(avCaptureVideoPreviewLayer, forKey:key)
        view.layer.addSublayer(avCaptureVideoPreviewLayer)
    }
    
    func addSubLayer(label:UILabel,gradientLayer:CAGradientLayer,key:String) {
        
        if(label.layer.valueForKey(key) != nil){
            var oldGradientLayer: CAGradientLayer = label.layer.valueForKey(key) as CAGradientLayer
            oldGradientLayer.removeFromSuperlayer()
        }
        label.layer.setValue(gradientLayer, forKey:key)
        label.layer.addSublayer(gradientLayer)
    }
    
    func removeFromSuperview(view:UIView,no:Int) {
        
        if(view.viewWithTag(no) != nil){
            view.viewWithTag(no)
            var oldLabel: UILabel = view.viewWithTag(no) as UILabel
            oldLabel.removeFromSuperview()
        }
    }
}