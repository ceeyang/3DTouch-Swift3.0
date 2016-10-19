//
//  3DTouchViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/17.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit
import SafariServices
import SnapKit

class _DTouchViewController: UIViewController,UIViewControllerPreviewingDelegate {

    var touchBtn0 : MoveBtn!
    var touchBtn1 : UIButton!
    var moveView = MoveViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerPreview()
        
    }
    
    func setupUI() {
        title                = "3DTouch View"
        view.backgroundColor = UIColor.white
        
        //let btnTitleArr = ["Touch Me To Show MoveView",
        //                   "Touch Me To Show SafariView"]
        // var btnArr:[MoveBtn]     = []
        // var btnArr:Array<MoveBtn> = [] //两种方式均可
 
        touchBtn0 = MoveBtn()
        touchBtn0.backgroundColor = UIColor.lightGray
        touchBtn0.tag = 0;
        touchBtn0.dragEnable = true
        touchBtn0.setTitle("Touch Me To show MoveView", for: .normal)
        touchBtn0.setTitleColor(UIColor.green, for: .normal)
        touchBtn0.addTarget(self, action: #selector(touchBtnAction(sender:)), for: .touchUpInside)
        view.addSubview(touchBtn0!)
        touchBtn0.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(40 + 64)
            make.width.greaterThanOrEqualTo(100)
            make.height.equalTo(44)
        }
        
        touchBtn1 = UIButton()
        touchBtn1.backgroundColor = UIColor.lightGray
        touchBtn1.tag = 1;
        touchBtn1.setTitle("Touch Me To show Safari", for: .normal)
        touchBtn1.setTitleColor(UIColor.green, for: .normal)
        touchBtn1.addTarget(self, action: #selector(touchBtnAction(sender:)), for: .touchUpInside)
        view.addSubview(touchBtn1!)
        touchBtn1.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(touchBtn0.snp.bottom).offset(50)
            make.size.equalTo(touchBtn0.snp.size)
        }
    }

    func registerPreview() {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: touchBtn0!)
            registerForPreviewing(with: self, sourceView: touchBtn1!)
        } else {
            print("3DTouch is Not Support")
        }
    }
    
    func touchBtnAction(sender:UIButton) {
        navigationController?.pushViewController(moveView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension _DTouchViewController {
    
    @objc(previewingContext:commitViewController:) func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if previewingContext.sourceView == touchBtn0 {
            navigationController?.pushViewController(moveView, animated: true)
        } else {
            let safariView = SFSafariViewController(url: NSURL(string:"http://www.baidu.com")! as URL)
            navigationController?.pushViewController(safariView, animated: true)
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    
        if previewingContext.sourceView == touchBtn0 {
            moveView.preferredContentSize = CGSize(width: 0, height: 0)
            return moveView
        } else {
            return SFSafariViewController(url: NSURL(string:"http://www.baidu.com")! as URL)
        }
    }

}

extension SFSafariViewController {
    
    open override var previewActionItems: [UIPreviewActionItem] {
        get {
            let action0 = UIPreviewAction(title: "Default Btn", style: .default) { (action, viewController) in
                print("Default Action")
            }
            let action1 = UIPreviewAction(title: "Selected Btn", style: .selected, handler: { (action, viewController) in
                print("Selected Action")
            })
            let action2 = UIPreviewAction(title: "Destructive Btn", style: .destructive) { (action, viewController) in
                print("Destructive Action")
            }
            
            return [UIPreviewAction](arrayLiteral: action0,action1,action2)
        }
    }
}
