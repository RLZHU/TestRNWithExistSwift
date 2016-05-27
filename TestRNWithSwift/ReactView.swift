//
//  ReactView.swift
//  TestRNWithSwift
//
//  Created by zhu on 16/5/26.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit
import React

class ReactView: UIView {

    let rootView: RCTRootView = RCTRootView(bundleURL: NSURL(string: "http://localhost:8081/index.ios.bundle?platform=ios&dev=true"),
                                            moduleName: "SimpleApp",
                                            initialProperties: nil,
                                            launchOptions: nil)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        loadReact()
    }
    
    func loadReact () {
        addSubview(rootView)
        rootView.frame = self.bounds
    }

}
