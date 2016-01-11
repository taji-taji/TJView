//
//  ViewController.swift
//  TJView
//
//  Created by Yutaka Tajika on 12/27/2015.
//  Copyright (c) 2015 Yutaka Tajika. All rights reserved.
//

import UIKit
import TJView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRectMake(10, 200, 200, 100)
        let subView = TJView(frame: frame)
        subView.backgroundColor = UIColor.whiteColor()
        subView.topBorderWidth = 10
        subView.topBorderColor = UIColor.redColor()
        subView.cornerRadiusTopRight = true
        subView.cornerRadius = 5.5
        
        self.view.addSubview(subView)
        
        let frame2 = CGRectMake(10, 310, 250, 100)
        let subView2 = TJView(frame: frame2)
        subView2.backgroundColor = UIColor.whiteColor()
        subView2.borderPositions([.Top, .Bottom], borderWidth: 3.5, borderColor: UIColor.greenColor())
        
        self.view.addSubview(subView2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

