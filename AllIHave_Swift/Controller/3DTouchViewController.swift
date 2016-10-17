//
//  3DTouchViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/17.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit
import WebKit

class _DTouchViewController: UIViewController,UIViewControllerPreviewingDelegate {

    var touchBtn0 : UIButton?
    var touchBtn1 : UIButton?
    var moveView = MoveViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerPreview()
        
    }
    
    func setupUI() {
        title                = "3DTouch View"
        view.backgroundColor = UIColor.white
        
        touchBtn0 = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 44))
        touchBtn0?.backgroundColor = UIColor.lightGray
        touchBtn0?.tag = 0;
        touchBtn0?.setTitle("Touch Me To show MoveView", for: .normal)
        touchBtn0?.setTitleColor(UIColor.green, for: .normal)
        touchBtn0?.addTarget(self, action: #selector(touchBtnAction(sender:)), for: .touchUpInside)
        view.addSubview(touchBtn0!)
        
        touchBtn1 = UIButton(frame: CGRect(x: 100, y: 200, width: 150, height: 44))
        touchBtn1?.backgroundColor = UIColor.lightGray
        touchBtn1?.tag = 1;
        touchBtn1?.setTitle("Touch Me To show Safari", for: .normal)
        touchBtn1?.setTitleColor(UIColor.green, for: .normal)
        touchBtn1?.addTarget(self, action: #selector(touchBtnAction(sender:)), for: .touchUpInside)
        view.addSubview(touchBtn1!)
    }

    func registerPreview() {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: touchBtn0!)
            registerForPreviewing(with: self, sourceView: touchBtn1!)
        } else {
            print("该设备部支持 3DTouch !")
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
            
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    
        if previewingContext.sourceView == touchBtn0 {
            moveView.preferredContentSize = CGSize(width: 0, height: 0)
            return moveView
        } else {
            return UIViewController()
            //return  SFSafariViewController(URL: NSURL(string:"http://ray.dotnetage.com")!)
        }
    }
}