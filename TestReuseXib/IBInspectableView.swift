//
//  IBInspectableView.swift
//  TestReuseXib
//
//  Created by Devin Wang on 16/4/20.
//  Copyright © 2016年 devin. All rights reserved.
//

import UIKit

@IBDesignable
class IBInspectableView: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 0
    @IBInspectable var fillColor: UIColor = UIColor.whiteColor()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        let bound = self.bounds
        CGContextSetLineWidth(context, lineWidth)
        
        fillColor.set()
        UIRectFrame(bound)
    }

}
