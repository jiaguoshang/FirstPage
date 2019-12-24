//
//  HomeViewController.swift
//  slider
//
//  Created by 李立德 on 2019/11/11.
//  Copyright © 2019 李立德. All rights reserved.
//

import UIKit
import SDAutoLayout
//import Kingfisher
import MJRefresh
//import AppUtils
//import NewTableViewCell

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataSource = [[String:String]()]
    var tableView:UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? NewTableViewCell
        if cell==nil {
            cell = NewTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.userLabel.text = dict["name"]
        cell?.sexLabel.text = dict["sex"]
        cell?.birthdayLabel.text = dict["birthday"]
        return cell!
    }
    
    //MARK: UITableViewDelegate
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        SCREENWIDTH
        return 74.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.orange;
        return headerView
    }
    
//    func (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "头部刷新样式"
        } else if section == 1 {
            return "尾部刷新样式"
        }
        return nil
    }
    
    var umberSlider : LDSlider!
//    var tableView: UITableView!
      /// 自定义头部
//     private lazy var largeTitleView: ASLargeTitleView = {
//
//          let largeTitleView = ASLargeTitleView(frame: CGRect(x: 0, y: 0, width: Int(SCREENWIDTH), height: NAVIGATION_BAR_HEIGHT))
//          return largeTitleView
//
//      }()
      
//    private lazy var tableV: UITableView = {
//
//          let tableV = UITableView(frame: CGRect(x: 0, y: CGFloat(STATUS_BAR_HEIGHT), width: SCREENWIDTH, height: SCREENHEIGHT - CGFloat(NAVIGATION_BAR_HEIGHT)), style: .plain)
//          tableV.tableFooterView = UIView()
//          return tableV
//
//      }()
    

    
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
        self.view.addSubview(self.nickLabel)
        _ = self.nickLabel.sd_layout().topSpaceToView(self.umberSlider, 100)?.leftSpaceToView(self.view, 100)?.rightSpaceToView(self.view, 100)?.heightIs(30);
         self.umberSlider.setisShowTitle()
        
        self.tableView = UITableView(frame: view.bounds, style: .grouped)
        self.tableView?.backgroundColor = UIColor.white;
        self.view.addSubview(self.tableView!)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        // 顶部刷新
           let header = MJRefreshNormalHeader()
        // 底部刷新
           let footer = MJRefreshAutoNormalFooter()
        
        //隐藏时间
        header.lastUpdatedTimeLabel?.isHidden = true
//        //隐藏状态
//        header.stateLabel?.isHidden = true
        // 下拉刷新
        
        //修改文字
        header.setTitle("下拉刷新", for: .idle)
        header.setTitle("下拉刷新", for: .pulling)
        header.setTitle("正在刷新...", for: .refreshing)
        
        //修改文字
        footer.setTitle("", for: .idle)
        footer.setTitle("上拉刷新", for: .pulling)
        footer.setTitle("正在加载更多...", for: .refreshing)
                 
        //修改字体
        header.stateLabel?.font = UIFont.systemFont(ofSize: 15)
        header.lastUpdatedTimeLabel?.font = UIFont.systemFont(ofSize: 13)
                 
        //修改文字颜色
        header.stateLabel?.textColor = UIColor.red
        header.lastUpdatedTimeLabel?.textColor = UIColor.blue
         
        
        //修改字体
        footer.stateLabel?.font = UIFont.systemFont(ofSize: 15)
                 
        //修改文字颜色
        footer.stateLabel?.textColor = UIColor.red
        
         header.setRefreshingTarget(self, refreshingAction: #selector(self.headerRefresh))
         // 现在的版本要用mj_header
         /*
         header.setTitle("下拉刷新", for: .idle)
         header.setTitle("释放更新", for: .pulling)
         header.setTitle("正在刷新...", for: .refreshing)
         self.tableview.mj_header = header
         */
         
         // 上拉刷新
         footer.setRefreshingTarget(self, refreshingAction: #selector(self.footerRefresh))
        self.tableView?.mj_footer = footer
        self.tableView?.mj_header = header
        self.tableView?.mj_footer?.isHidden = false
        self.tableView?.mj_header?.isHidden = false
         header.beginRefreshing()
        
//        self.tableView.myh_header = MYHRefreshNormalHeader.init(refreshingBlock: { [weak self]() in
//            print("头部-刷新中。。。。")
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self?.tableView.myh_header?.endRefreshing {
//                    print("头部-自动结束刷新了")
//                }
//            }
//        })
//
//        self.tableView.myh_footer = MYHRefreshBackNormalFooter.init(refreshingBlock: {  [weak self]() in
//            print("尾部-刷新中。。。。")
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                print("尾部-自动结束刷新了-没有更多数据了")
//                self?.tableView.myh_footer?.endRefreshingWithNoMoreData()
//            }
//        }, arrowType: .black)
        
        dataSource = [
        ["name":"王小明","sex":"男","icon":"my_def_photo","birthday":"2017-10-11"],
        ["name":"李磊","sex":"男","icon":"my_def_photo","birthday":"2011-12-30"],
        ["name":"韩梅","sex":"女","icon":"my_def_photo","birthday":"2014-9-10"],
        ["name":"JIM","sex":"男","icon":"my_def_photo","birthday":"2008-10-1"]]
        self.tableView?.reloadData()
        
//        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
//        self.tableView.myh_header = MYHRefreshNormalHeader.init(refreshingBlock: { [weak self]() in
//            print("头部-刷新中。。。。")
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self?.tableView.myh_header?.endRefreshing {
//                    print("头部-自动结束刷新了")
//                }
//            }
//        })
//
//        self.tableView.myh_footer = MYHRefreshBackNormalFooter.init(refreshingBlock: {  [weak self]() in
//            print("尾部-刷新中。。。。")
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                print("尾部-自动结束刷新了-没有更多数据了")
//                self?.tableView.myh_footer?.endRefreshingWithNoMoreData()
//            }
//        }, arrowType: .black)
    }

    //昵称
    lazy var nickLabel: UILabel = {
        let nickName = UILabel()
        nickName.textColor = UIColor.black;
        nickName.font = UIFont.systemFont(ofSize: 16)
        nickName.text = "nickName"
        return nickName
    }()
    
//    //头像
//    lazy var headImage: AnimatedImageView = {
//        let headimage = AnimatedImageView()
//        //                headimage.layer.cornerRadius = 15
//        //                headimage.clipsToBounds = true
//        return headimage
//    }()
    
    //初始化数据
//    func refreshItemData() {
//        items = []
//        for _ in 0...9 {
//            items.append("条目\(Int(arc4random()%100))")
//        }
//    }
    
    // 顶部刷新
    @objc func headerRefresh(){
        
        print("下拉刷新.")
        DispatchQueue.main.async { [weak self]() in
                                    sleep(2)
                                    //重现生成数据
                            //        refreshItemData()
                                    //重现加载表格数据
                                    self!.tableView?.reloadData()
                                    //结束刷新
                                    self!.tableView!.mj_header?.endRefreshing()
        }


       }

    // 底部刷新
    @objc func footerRefresh(){

           print("上拉刷新")
        DispatchQueue.main.async { [weak self]() in
                            sleep(2)
                    //重现生成数据
            //        refreshItemData()
                    //重现加载表格数据
                    self!.tableView?.reloadData()
                    //结束刷新
                    self!.tableView!.mj_footer?.endRefreshing()
        }

        
       }
}

