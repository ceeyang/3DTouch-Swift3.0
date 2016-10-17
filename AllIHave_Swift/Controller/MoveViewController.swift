//
//  MoveViewController.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/9.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController {

    
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
        self.navigationItem.rightBarButtonItem = setBtnItem
        
        /** MoveBtn */
        moveBtn                 = MoveBtn(frame: CGRect(x: 100, y: 100, width: 100, height: 44))
        moveBtn.backgroundColor = UIColor.lightGray
        moveBtn.titleLabel?.text="Test Move Btn"
        moveBtn.tintColor       = UIColor.green
        moveBtn.addTarget(self, action: #selector(moveBtnClickAction), for: .touchUpInside)
        view.addSubview(moveBtn)
        
        moveImg                 = MoveImg(image: UIImage(named:"Img1.jpg"))
        moveImg.isUserInteractionEnabled = true
        moveImg.backgroundColor = UIColor.yellow
        moveImg.frame           = CGRect(x: 100, y: 150, width: 200, height: 200)
        view.addSubview(moveImg)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
