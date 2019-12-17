//
//  HomeViewController.swift
//  slider
//
//  Created by 李立德 on 2019/11/11.
//  Copyright © 2019 李立德. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var umberSlider : LDSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.green
        self.umberSlider = LDSlider.init()
        self.umberSlider.frame = CGRect (x: 100, y: 100, width: 200, height: 30)
        //设置最大和最小值
       
        self.umberSlider.minimumValue = 0;
        self.umberSlider.maximumValue = 100;
        self.umberSlider.maximumTrackTintColor = UIColor.orange
        self.umberSlider.thumbTintColor = UIColor.blue;///设置滑块按钮的颜色
        self.view.addSubview(self.umberSlider)
         self.umberSlider.setisShowTitle()
    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)  {
//
//          super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//    }
//    convenience init()  {
//
//          let nibNameOrNil = String?("MyLaunchVC")
//
//          self.init(nibName: nibNameOrNil, bundle: nil)
//
//    }
//    required init(coder aDecoder: NSCoder)  {
//
//          fatalError("init(coder:) has not been implemented")
//
//    }



}

