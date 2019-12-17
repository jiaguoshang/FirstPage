//
//  LDSlider.swift
//  slider
//
//  Created by 李立德 on 2019/11/11.
//  Copyright © 2019 李立德. All rights reserved.
//

import UIKit
import Masonry
class LDSlider: UISlider {
    var sliderValueLabel : UILabel?
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let  ldresult = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        return ldresult
        
    }
    
    func setisShowTitle(){
    
        self.isContinuous = true
        
        self.addTarget(self, action: #selector(sliderAction(slider:)), for: .valueChanged)
        // 当前值label
        self.sliderValueLabel = UILabel.init()
        self.sliderValueLabel?.textAlignment = .center;
        self.sliderValueLabel!.font = UIFont.systemFont(ofSize: 14)
        self.sliderValueLabel!.textColor = UIColor.orange
        self.sliderValueLabel!.text = String(format: "%.0f分钟", self.value)
        self.addSubview(self.sliderValueLabel!)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let slider : UIImageView = self.subviews.last as! UIImageView
            self.sliderValueLabel?.mas_makeConstraints({ (make:MASConstraintMaker!) in
                make.top.mas_equalTo()(slider.mas_bottom)!.offset()(5);
                make.centerX.equalTo()(slider);
            })
        }
        
    }
    @objc func sliderAction(slider : UISlider){
//        self.sliderValueLabel.text = [NSString stringWithFormat:@"%f分钟", self.value];
        self.sliderValueLabel!.text = String(format: "%.0f分钟", self.value)
    }
}
