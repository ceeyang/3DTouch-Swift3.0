//
//  MoveView.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/8.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit

//MARK: - UIView
class MoveView: UIView {
    
    fileprivate var beginPoint : CGPoint?
    open  var dragEnable : Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.dragEnable {
            let touch  = (touches as NSSet).anyObject() as! UITouch
            beginPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if self.dragEnable {
            let touch    = (touches as NSSet).anyObject() as! UITouch
            let newPoint = touch.location(in: self)
            let offSetX  = newPoint.x - beginPoint!.x
            let offSetY  = newPoint.y - beginPoint!.y
            self.center  = CGPoint(x: self.center.x + offSetX, y: self.center.y + offSetY)
        }
    }
}

//MARK: - UIButton
class MoveBtn: UIButton {
    
    fileprivate var beginPoint : CGPoint?
    open  var dragEnable : Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.dragEnable {
            let touch  = (touches as NSSet).anyObject() as! UITouch
            beginPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if self.dragEnable {
            let touch    = (touches as NSSet).anyObject() as! UITouch
            let newPoint = touch.location(in: self)
            let offSetX  = newPoint.x - beginPoint!.x
            let offSetY  = newPoint.y - beginPoint!.y
            self.center  = CGPoint(x: self.center.x + offSetX, y: self.center.y + offSetY)
        }
    }
}

//MARK: - UIImageView
class MoveImg: UIImageView {
    
    fileprivate var beginPoint : CGPoint?
    open  var dragEnable : Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.dragEnable {
            let touch  = (touches as NSSet).anyObject() as! UITouch
            beginPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if self.dragEnable {
            let touch    = (touches as NSSet).anyObject() as! UITouch
            let newPoint = touch.location(in: self)
            let offSetX  = newPoint.x - beginPoint!.x
            let offSetY  = newPoint.y - beginPoint!.y
            self.center  = CGPoint(x: self.center.x + offSetX, y: self.center.y + offSetY)
        }
    }
}

//MARK: - UILabel
class MoveLabel: UILabel {
    
    fileprivate var beginPoint : CGPoint?
    open  var dragEnable : Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.dragEnable {
            let touch  = (touches as NSSet).anyObject() as! UITouch
            beginPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if self.dragEnable {
            let touch    = (touches as NSSet).anyObject() as! UITouch
            let newPoint = touch.location(in: self)
            let offSetX  = newPoint.x - beginPoint!.x
            let offSetY  = newPoint.y - beginPoint!.y
            self.center  = CGPoint(x: self.center.x + offSetX, y: self.center.y + offSetY)
        }
    }
}

//MARK: - UITextField
class MoveTextField: UITextField {
    
    fileprivate var beginPoint : CGPoint?
    open  var dragEnable : Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.dragEnable {
            let touch  = (touches as NSSet).anyObject() as! UITouch
            beginPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if self.dragEnable {
            let touch    = (touches as NSSet).anyObject() as! UITouch
            let newPoint = touch.location(in: self)
            let offSetX  = newPoint.x - beginPoint!.x
            let offSetY  = newPoint.y - beginPoint!.y
            self.center  = CGPoint(x: self.center.x + offSetX, y: self.center.y + offSetY)
        }
    }
}

