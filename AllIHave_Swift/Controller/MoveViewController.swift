//
//  MoveViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/9.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit
import SafariServices

class MoveViewController: UIViewController,UIViewControllerPreviewingDelegate {

    
    var moveBtn = MoveBtn()
    var moveImg = MoveImg()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
    }
    
    func setupUI() {
        
        title                   = "Move View"
        view.backgroundColor    = UIColor.white
        
        /** setBtn */
        let setBtn              = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        setBtn.setTitle("DragEnabel", for: .normal)
        setBtn.setTitleColor(UIColor.black, for: .normal)
        setBtn.addTarget(self, action: #selector(setBtnClickAction(_:)), for: .touchUpInside)
        let setBtnItem          = UIBarButtonItem(customView: setBtn)
        navigationItem.rightBarButtonItem = setBtnItem
        
        /** MoveBtn */
        moveBtn                 = MoveBtn(frame: CGRect(x: 100, y: 100, width: 100, height: 44))
        moveBtn.backgroundColor = UIColor.lightGray
        moveBtn.setTitle("Test Move Btn", for: .normal)
        moveBtn.setTitleColor(UIColor.green, for: .normal)
        moveBtn.addTarget(self, action: #selector(moveBtnClickAction), for: .touchUpInside)
        view.addSubview(moveBtn)
        
        moveImg                 = MoveImg(image: UIImage(named:"Img1.jpg"))
        moveImg.isUserInteractionEnabled = true
        moveImg.backgroundColor = UIColor.yellow
        moveImg.frame           = CGRect(x: 100, y: 150, width: 200, height: 200)
        view.addSubview(moveImg)
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: moveImg)
        }
    }
    
    
    func setBtnClickAction(_ sender:UIButton) {
        moveBtn.dragEnable ? sender.setTitle("DragEnable", for: .normal) : sender.setTitle("DragAble", for: .normal)
        moveBtn.dragEnable = !moveBtn.dragEnable
        moveImg.dragEnable = !moveImg.dragEnable
    }
    
    func moveBtnClickAction() {
        if moveBtn.dragEnable {
            return
        }
        print("Move Btn Click")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension MoveViewController {
    @objc(previewingContext:commitViewController:)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//        if previewingContext.sourceView == moveImg {
//            let imageView = UIImageView(image: UIImage(named:"Img1.jpg"))
//            //imageView.preferredContentSize = CGSize(width: 0, height: 0)
//            return imageView
//        } else {
            return nil
//        }
    }
}


