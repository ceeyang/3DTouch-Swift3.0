//
//  HomeViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/8.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit

let CellIdentifier : String = "CellReuseIdentifier"

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var mainTableView = UITableView()
    var dataArray : Array<String> = []
    let moveView = MoveViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = ["MoveView","Others"]
        setupUI()
    }
    
    func setupUI() {
        
        title                    = "AllIHave_Swift"
        view.backgroundColor     = UIColor.white
        
        /** MainTableView */
        mainTableView            = UITableView(frame: view.frame, style: .plain)
        mainTableView.delegate   = self
        mainTableView.dataSource = self
        view.addSubview(mainTableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - UITableViewDataSource & delegate -
extension HomeViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell             = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.accessoryType   = .disclosureIndicator
        return cell
    }
    
    @objc(tableView:didSelectRowAtIndexPath:)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Did Selected At Row : \(indexPath.row)")
        if indexPath.row == 0 {
            navigationController?.pushViewController( moveView, animated: true)
        } else {
            navigationController?.pushViewController( _DTouchViewController(), animated: true)
        }
    }
}
