//
//  GCDTestViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/11/1.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit

class GCDTestViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var mainTableView = UITableView()
    var dataArray:Array<String> = ["globalAsync","globalSync","globalQueue0","globalQueue1","globalQueue2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /** MainTableView */
        mainTableView                 = UITableView()
        mainTableView.tableFooterView = UIView()
        mainTableView.delegate        = self
        mainTableView.dataSource      = self
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func globalAsync() {
        print("     "+"\(Thread.current)")
        DispatchQueue.global().async {
            for _ in 0...10 {
                print("Task " + "\(Thread.current)")
            }
        }
        print("After" + "\(Thread.current)")
    }

    func globalSync() {
        print("     "+"\(Thread.current)")
        DispatchQueue.global().sync {
            for _ in 0...10 {
                print("Task " + "\(Thread.current)")
            }
        }
        print("After" + "\(Thread.current)")
    }
    
    func globalQueue0() {
        print("     "+"\(Thread.current)")
        let globQueue = DispatchQueue.global()
        for _ in 0...10 {
            globQueue.async {
                print("Task " + "\(Thread.current)")
            }
        }
        print("after" + "\(Thread.current)")
    }
    
    func globalQueue1() {
        print("     "+"\(Thread.current)")
        for _ in 0...10 {
            // 全局对了异步
            DispatchQueue.global().async {
                for _ in 0...10 {
                    print("Task " + "\(Thread.current)")
                }
            }
        }
        print("after" + "\(Thread.current)")
    }
    
    func globalQueue2() {
        print("     "+"\(Thread.current)")
        DispatchQueue.global().async {
            for _ in 0...10 {
                print("Task " + "\(Thread.current)")
            }
            DispatchQueue.main.async {
                print("main " + "\(Thread.current)")
            }
        }
        print("after" + "\(Thread.current)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension GCDTestViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell             = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    @objc(tableView:didSelectRowAtIndexPath:)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            globalAsync()
        } else if indexPath.row == 1{
            globalSync()
        } else if indexPath.row == 2{
            globalQueue0()
        } else if indexPath.row == 3{
            globalQueue1()
        } else if indexPath.row == 4{
            globalQueue2()
        }
    }

}
