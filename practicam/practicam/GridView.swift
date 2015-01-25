//
//  GridView.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/11/29.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.
//

import UIKit
import Foundation

class GridView {
    var baseView:UIView!
    var sizeAdjuster:SizeAdjuster!
    let BORDOR_COLOR = "ff8800"
    let BORDOR_ALPHA = CGFloat(1.0)
    let BORDOR_WIDTH = CGFloat(6)
    let SUB_COLOR = "000000"
    let SUB_ALPHA = CGFloat(0.4)
    
    init(view:UIView){
        self.baseView = view
        self.sizeAdjuster = SizeAdjuster(view:view)
    }
    
    func removeAnother() {
        for(var i = 100; i < 200; i++){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.baseView, no: i)
        }
    }
    
    func createCircle() {
        
        removeAnother()
        // Labelを作成.
        let label = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.getDivShortSide(0.8),self.sizeAdjuster.getDivShortSide(0.8)))
        label.layer.borderColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label.layer.borderWidth = self.BORDOR_WIDTH
        label.layer.cornerRadius = self.sizeAdjuster.getDivShortSide(0.4)
        label.layer.position = self.baseView.center
            
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label,no:UINoStruct.LABEL_GRID_1_1)
    }
    
    func createS() {
        
        removeAnother()
        // Labelを作成.
        let label = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.getDivShortSide(1),self.sizeAdjuster.getDivShortSide(1)))
        label.text = "S"
        label.textColor = UIColor.getColor(self.BORDOR_COLOR, alpha: 1.0)
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: "GillSans-LightItalic", size: self.sizeAdjuster.getDivShortSide(1))
        label.layer.position = self.baseView.center
        
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label,no:UINoStruct.LABEL_GRID_2_1)
    }
    
    func create3Div() {
        
        removeAnother()
        // Labelを作成.
        let label1 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[32]!,self.sizeAdjuster.sizeDicHeight[32]!))
        label1.layer.borderColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label1.layer.borderWidth = self.BORDOR_WIDTH
        label1.layer.position = self.baseView.center
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label1,no:UINoStruct.LABEL_GRID_3_1)
        
        let label2 = UILabel(frame: CGRectMake(0,0,self.BORDOR_WIDTH,self.sizeAdjuster.sizeDicHeight[32]!))
        label2.layer.backgroundColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label2.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[11]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label2,no:UINoStruct.LABEL_GRID_3_2)
        
        let label3 = UILabel(frame: CGRectMake(0,0,self.BORDOR_WIDTH,self.sizeAdjuster.sizeDicHeight[32]!))
        label3.layer.backgroundColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label3.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[22]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label3,no:UINoStruct.LABEL_GRID_3_3)
        
        let label4 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[32]!,self.BORDOR_WIDTH))
        label4.layer.backgroundColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label4.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[16]!, y:self.sizeAdjuster.sizeDicHeight[11]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label4,no:UINoStruct.LABEL_GRID_3_4)
        
        let label5 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[32]!,self.BORDOR_WIDTH))
        label5.layer.backgroundColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label5.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[16]!, y:self.sizeAdjuster.sizeDicHeight[22]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label5,no:UINoStruct.LABEL_GRID_3_5)
    }
    
    func create2Div() {
        
        removeAnother()
        // Labelを作成.
        let label1 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[32]!,self.sizeAdjuster.sizeDicHeight[32]!))
        label1.layer.borderColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label1.layer.borderWidth = self.BORDOR_WIDTH
        label1.layer.position = self.baseView.center
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label1,no:UINoStruct.LABEL_GRID_4_1)
        
        let label2 = UILabel(frame: CGRectMake(0,0,self.BORDOR_WIDTH,self.sizeAdjuster.sizeDicHeight[32]!))
        label2.layer.backgroundColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label2.layer.position = self.baseView.center
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label2,no:UINoStruct.LABEL_GRID_4_2)
        
        let label3 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[32]!,self.BORDOR_WIDTH))
        label3.layer.backgroundColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label3.layer.position = self.baseView.center
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label3,no:UINoStruct.LABEL_GRID_4_3)
    }
    
    func createDiagonalLeft() {
        
        removeAnother()
        // Labelを作成.
        let label = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[1]!,self.sizeAdjuster.getRateHeight(2)))
        var colors = [UIColor]()
        colors.append(UIColor.getColor(self.BORDOR_COLOR, alpha: 0.1))
        colors.append(UIColor.getColor(self.BORDOR_COLOR, alpha: 1.0))
        UIColor.setGradientLayer(label, colors: colors)
        label.layer.position = self.baseView.center
        var rate = Double(self.baseView.bounds.width / self.baseView.bounds.height)
        label.transform = CGAffineTransformRotate(label.transform, -CGFloat(M_PI/4 * rate))
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label,no:UINoStruct.LABEL_GRID_6_1)
    }
    
    func createDiagonalRight() {
        
        removeAnother()
        // Labelを作成.
        let label = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[1]!,self.sizeAdjuster.getRateHeight(2)))
        var colors = [UIColor]()
        colors.append(UIColor.getColor(self.BORDOR_COLOR, alpha: 0.1))
        colors.append(UIColor.getColor(self.BORDOR_COLOR, alpha: 1.0))
        UIColor.setGradientLayer(label, colors: colors)
        label.layer.position = self.baseView.center
        var rate = Double(self.baseView.bounds.width / self.baseView.bounds.height)
        label.transform = CGAffineTransformRotate(label.transform, CGFloat(M_PI/4 * rate))
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label,no:UINoStruct.LABEL_GRID_5_1)
    }
    
    func createDwindle() {
        
        removeAnother()
        
        var colors = [UIColor]()
        colors.append(UIColor.getColor(self.BORDOR_COLOR, alpha: 0.1))
        colors.append(UIColor.getColor(self.BORDOR_COLOR, alpha: 1.0))
        var rate = Double(self.baseView.bounds.width / self.baseView.bounds.height)
        
        // Labelを作成.
        let label1 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[1]!,self.sizeAdjuster.getRateHeight(2)))
        UIColor.setGradientLayer(label1, colors: colors)
        label1.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[2]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        label1.transform = CGAffineTransformRotate(label1.transform, CGFloat(M_PI/4 * rate / 2))
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label1,no:UINoStruct.LABEL_GRID_7_1)
        
        let label2 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[1]!,self.sizeAdjuster.getRateHeight(2)))
        UIColor.setGradientLayer(label2, colors: colors)
        label2.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[30]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        label2.transform = CGAffineTransformRotate(label2.transform, -CGFloat(M_PI/4 * rate / 2))
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label2,no:UINoStruct.LABEL_GRID_7_2)
    }
    
    func createGap() {
        
        removeAnother()
        // Labelを作成.
        let label1 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[8]!,self.sizeAdjuster.sizeDicHeight[32]!))
        label1.layer.borderColor = UIColor.getColor(self.BORDOR_COLOR, alpha: self.BORDOR_ALPHA).CGColor
        label1.layer.borderWidth = self.BORDOR_WIDTH
        label1.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[16]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label1,no:UINoStruct.LABEL_GRID_8_1)
        
        let label2 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[12]!,self.sizeAdjuster.sizeDicHeight[32]!))
        label2.layer.backgroundColor = UIColor.getColor(self.SUB_COLOR, alpha: self.SUB_ALPHA).CGColor
        label2.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[6]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label2,no:UINoStruct.LABEL_GRID_8_2)
        
        let label3 = UILabel(frame: CGRectMake(0,0,self.sizeAdjuster.sizeDicWidth[12]!,self.sizeAdjuster.sizeDicHeight[32]!))
        label3.layer.backgroundColor = UIColor.getColor(self.SUB_COLOR, alpha: self.SUB_ALPHA).CGColor
        label3.layer.position = CGPoint(x: self.sizeAdjuster.sizeDicWidth[26]!, y:self.sizeAdjuster.sizeDicHeight[16]!)
        ViewHelper.viewHelperInstance.addSubview(self.baseView,label:label3,no:UINoStruct.LABEL_GRID_8_3)
        
    }
}