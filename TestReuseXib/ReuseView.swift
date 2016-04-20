//
//  ReuseView.swift
//  TestReuseXib
//
//  Created by Devin Wang on 16/4/20.
//  Copyright © 2016年 devin. All rights reserved.
//

import UIKit

@IBDesignable
class ReuseView: UIView {
    
    @IBOutlet private weak var view: UIView!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var switchI: UISwitch!
    
    /**
     *
     When Interface Builder renders your IBDesignable views, it uses a helper app to load everything. The upshot of this is that the mainBundle at design time is related to the helper app, and it's not your app's mainBundle. You can see that the path mentioned in the error has nothing to do with your app:
     </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Xcode/Overlays> (loaded)
     
     When loading the nib, you're relying on the fact that passing bundle: nil defaults to your app's mainBundle at run time.
     let nib = UINib(nibName: String(StripyView), bundle: nil)
     
     So instead, you need to pass the correct bundle here. Fix the above line with the following:
     let bundle = NSBundle(forClass: self.dynamicType)
     bundle.loadNibNamed(String(self.dynamicType), owner: self, options: nil)
     *
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initViews()
    }
    
    private func initViews() {
        let bundle = NSBundle(forClass: self.dynamicType)
        bundle.loadNibNamed(String(self.dynamicType), owner: self, options: nil)
        self.view.frame = self.bounds
        
        self.addSubview(self.view)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
