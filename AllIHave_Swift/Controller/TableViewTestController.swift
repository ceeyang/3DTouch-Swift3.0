//
//  TableViewTestController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/11/4.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit

class TableViewTestController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.frame)
        tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TableViewTestController {
    @objc(numberOfSectionsInTableView:) func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    @objc(tableView:cellForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "testCellIdentifier", for: indexPath) as! TestTableViewCell
        if cell == nil {
            cell = TestTableViewCell(style: .default, reuseIdentifier: "testCellIdentifier")
        }
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    @objc(tableView:didSelectRowAtIndexPath:)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
