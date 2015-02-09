//
//  GridSelectLabel.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/12/13.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.
//

import UIKit
import Foundation

class GridSelectLabel : NSObject{
    var baseView:UIView!
    var sizeAdjuster:SizeAdjuster!
    
    init(view:UIView){
        self.baseView = view
        self.sizeAdjuster = SizeAdjuster(view:view)
    }
    
    func close(){
        
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BASE) != nil){
            var old: UILabel = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BASE) as UILabel
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_TEXT) != nil){
            var old: UITextView = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_TEXT) as UITextView
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON1) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON1) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON2) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON2) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON3) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON3) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON4) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON4) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON5) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON5) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON6) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON6) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON7) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON7) as UIButton
            old.removeFromSuperview()
        }
        if(self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON8) != nil){
            var old: UIButton = self.baseView.viewWithTag(UINoStruct.GRID_SELECT_BUTTON8) as UIButton
            old.removeFromSuperview()
        }
    }
    
    func createBaseLabel(){
        
        var baseLabel = UILabel()
        baseLabel.backgroundColor = UIColor.whiteColor()
        baseLabel.frame = CGRectMake(0, 0, self.sizeAdjuster.sizeDicWidth[8]!, self.sizeAdjuster.sizeDicHeight[24]!)
        baseLabel.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[16]!)
        baseLabel.alpha = 0.6
        baseLabel.layer.cornerRadius = 20
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:baseLabel,no:UINoStruct.GRID_SELECT_BASE)
        
        // TextViewを作成する.
        let textView: UITextView = UITextView(frame: CGRectMake(10, 10, self.sizeAdjuster.sizeDicWidth[8]!, self.sizeAdjuster.sizeDicHeight[12]!))
        textView.backgroundColor = UIColor.clearColor()
        textView.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[22]!)
        textView.text = ""
        textView.font = UIFont.systemFontOfSize(CGFloat(15))
        textView.textColor = UIColor.blackColor()
        textView.textAlignment = NSTextAlignment.Left
        textView.editable = false
        ViewHelper.viewHelperInstance.addSubview(self.baseView,text:textView,no:UINoStruct.GRID_SELECT_TEXT)
    }
    
    func createButton1()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "circle.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[27]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON1)
        return button
    }
    
    func createButton2()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "s.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[24]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON2)
        return button
    }
    
    func createButton3()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "3div.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[21]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON3)
        return button
    }
    
    func createButton4()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "2div.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[18]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON4)
        return button
    }
    
    func createButton5()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "diagonalR.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[15]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON5)
        return button
    }
    
    func createButton6()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "diagonalL.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[12]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON6)
        return button
    }
    
    func createButton7()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "dwindle.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[9]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON7)
        return button
    }
    
    func createButton8()->UIButton{
        
        // UIボタンを作成
        let button = UIButton(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[4]!,self.sizeAdjuster.sizeDicWidth[4]!))
        let image = UIImage(named: "gap.png")
        button.setImage(image, forState: .Normal)
        button.layer.position = CGPointMake(self.sizeAdjuster.sizeDicWidth[28]!, self.sizeAdjuster.sizeDicHeight[6]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView , button:button , no:UINoStruct.GRID_SELECT_BUTTON8)
        return button
    }
}