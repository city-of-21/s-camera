//
//  SizeAdjuster.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/12/04.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.
//

import UIKit
import Foundation

class SizeAdjuster {
    var baseView:UIView!
    var sizeDicWidth = Dictionary<Int,CGFloat>()
    var sizeDicHeight = Dictionary<Int,CGFloat>()
    let DIV:Int = 32
    init(view:UIView){
        self.baseView = view
        for(var i = 0; i <= DIV; i++){
            self.sizeDicWidth[i] = CGFloat(view.bounds.width) / CGFloat(self.DIV) * CGFloat(i)
            self.sizeDicHeight[i] = CGFloat(view.bounds.height) / CGFloat(self.DIV) * CGFloat(i)
        }
    }
    
    func getRateWidth(rate:CGFloat)->CGFloat{
        return self.baseView.bounds.width * rate
    }
    
    func getRateHeight(rate:CGFloat)->CGFloat{
        return self.baseView.bounds.height * rate
    }
    
    func getDivLongSide(rate:CGFloat)->CGFloat{
        if(self.baseView.bounds.width > self.baseView.bounds.height){
            return self.baseView.bounds.width * rate
        }else{
            return self.baseView.bounds.height * rate
        }
    }
    
    func getDivShortSide(rate:CGFloat)->CGFloat{
        if(self.baseView.bounds.width < self.baseView.bounds.height){
            return self.baseView.bounds.width * rate
        }else{
            return self.baseView.bounds.height * rate
        }
    }
}