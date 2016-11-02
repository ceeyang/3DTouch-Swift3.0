//
//  HomeViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/8.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit
import SafariServices
import SnapKit

let CellIdentifier : String = "CellReuseIdentifier"

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate {

    var mainTableView = UITableView()
    var dataArray : Array<String> = []
    let moveView = MoveViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = ["MoveView Test VC","3D-Touch Test VC","GCD Test VC", "Model Test VC"]
        setupUI()
        //registerPreview()
    }
    
    func setupUI() {
        
        title                         = "AllIHave_Swift"
        view.backgroundColor          = UIColor.white
        
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
    
    
    func registerPreview() {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: mainTableView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController {
    
    //MARK: - UITableViewDataSource & delegate -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    @objc(tableView:heightForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @objc(tableView:cellForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell             = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.accessoryType   = .disclosureIndicator
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: cell)
        }
        return cell
    }
    
    @objc(tableView:didSelectRowAtIndexPath:)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Did Selected At Row : \(indexPath.row)")
        if indexPath.row == 0 {
            navigationController?.pushViewController( moveView, animated: true)
        } else if indexPath.row == 1{
            navigationController?.pushViewController( _DTouchViewController(), animated: true)
        } else if indexPath.row == 2{
            navigationController?.pushViewController( GCDTestViewController(), animated: true)
        } else if indexPath.row == 3{
            navigationController?.pushViewController( ModelTestController(), animated: true)
        }
        
    }
    
    //MARK: - UIViewControllerPreviewingDelegate -
    @objc(previewingContext:commitViewController:)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {

        let indexPath = mainTableView.indexPath(for: previewingContext.sourceView as! UITableViewCell)
        if indexPath?.row == 0 {
            navigationController?.pushViewController( moveView, animated: true)
        } else if indexPath?.row == 1 {
            navigationController?.pushViewController( _DTouchViewController(), animated: true)
        } else {
            navigationController?.pushViewController( SFSafariViewController(url: NSURL(string: "http://www.baidu.com") as! URL), animated: true)
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let indexPath = mainTableView.indexPath(for: previewingContext.sourceView as! UITableViewCell)
        //let indexPath = mainTableView.indexPathForRow(at: location)
        //此处的 location 是根据当前注册的视图来判断的, 
        //如果注册的 tableviewcell 则不能用 tableview.indexPathForRow(at:location)取到 index 正确的值
        print("location : \(location),indexPath: \(indexPath)")
        if indexPath?.row == 0 {
            return moveView
        } else if indexPath?.row == 1 {
            return _DTouchViewController()
        } else {
            return nil
        }
    }
    
}
