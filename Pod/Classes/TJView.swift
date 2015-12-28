//
//  TJView.swift
//  Pods
//
//  Created by tajika on 2015/12/27.
//
//

import UIKit

public enum TJViewBorderPosition {
    case Top
    case Right
    case Bottom
    case Left
}

@IBDesignable
class TJView: UIView {
    
    var topBorder: CALayer = CALayer()
    var bottomBorder: CALayer = CALayer()
    var leftBorder: CALayer = CALayer()
    var rightBorder: CALayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBorderLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBorderLayer()
    }
    
    // - Top Border Properties

    @IBInspectable
    var topBorderWidth: CGFloat {
        get {
            return self.topBorderWidth
        }
        set {
            topBorder.frame = CGRectMake(0.0, 0.0, self.frame.width, newValue)
        }
    }
    
    @IBInspectable
    var topBorderColor: UIColor? {
        get {
            return self.topBorderColor
        }
        set {
            if let newValue = newValue {
                topBorder.backgroundColor = newValue.CGColor
            }
        }
    }

    // - Bottom Border Properties

    @IBInspectable
    var bottomBorderWidth: CGFloat {
        get {
            return self.bottomBorderWidth
        }
        set {
            bottomBorder.frame = CGRectMake(0.0, self.frame.height - newValue, self.frame.width, newValue)
        }
    }
    
    @IBInspectable
    var bottomBorderColor: UIColor? {
        get {
            return self.bottomBorderColor
        }
        set {
            if let newValue = newValue {
                bottomBorder.backgroundColor = newValue.CGColor
            }
        }
    }

    // - Left Border Properties
    
    @IBInspectable
    var leftBorderWidth: CGFloat {
        get {
            return self.leftBorderWidth
        }
        set {
            leftBorder.frame = CGRectMake(0.0, 0.0, newValue, self.frame.height)
        }
    }
    
    @IBInspectable
    var leftBorderColor: UIColor? {
        get {
            return self.leftBorderColor
        }
        set {
            if let newValue = newValue {
                leftBorder.backgroundColor = newValue.CGColor
            }
        }
    }

    // - Right Border Properties
    
    @IBInspectable
    var rightBorderWidth: CGFloat {
        get {
            return self.rightBorderWidth
        }
        set {
            rightBorder.frame = CGRectMake(self.frame.width - newValue, 0.0, newValue, self.frame.height)
        }
    }
    
    @IBInspectable
    var rightBorderColor: UIColor? {
        get {
            return self.rightBorderColor
        }
        set {
            if let newValue = newValue {
                rightBorder.backgroundColor = newValue.CGColor
            }
        }
    }
    
    private func addBorderLayer() {
        self.layer.addSublayer(topBorder)
        self.layer.addSublayer(bottomBorder)
        self.layer.addSublayer(leftBorder)
        self.layer.addSublayer(rightBorder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let selfWidth = self.bounds.size.width
        let selfHeight = self.bounds.size.height
        topBorder.frame.size.width = selfWidth
        bottomBorder.frame.size.width = selfWidth
        leftBorder.frame.size.height = selfHeight
        rightBorder.frame.size.height = selfHeight
        rightBorder.frame.origin.x = selfWidth
    }
    
    func borderPositions(positions: [TJViewBorderPosition], borderWidth: CGFloat, borderColor: UIColor?) {
        self.layer.sublayers = nil
        if positions.contains(.Top) {
            borderTop(borderWidth, borderColor: borderColor)
        }
        if positions.contains(.Left) {
            borderLeft(borderWidth, borderColor: borderColor)
        }
        if positions.contains(.Bottom) {
            borderBottom(borderWidth, borderColor: borderColor)
        }
        if positions.contains(.Right) {
            borderRight(borderWidth, borderColor: borderColor)
        }
    }
    
    func borderTop(borderWidth: CGFloat, borderColor: UIColor?) {
        topBorderWidth = borderWidth
        topBorderColor = borderColor
    }
    
    func borderBottom(borderWidth: CGFloat, borderColor: UIColor?) {
        bottomBorderWidth = borderWidth
        bottomBorderColor = borderColor
    }

    func borderLeft(borderWidth: CGFloat, borderColor: UIColor?) {
        leftBorderWidth = borderWidth
        leftBorderColor = borderColor
    }

    func borderRight(borderWidth: CGFloat, borderColor: UIColor?) {
        rightBorderWidth = borderWidth
        rightBorderColor = borderColor
    }
//
//    private func addBorderWithRect(borderLayer: CALayer, borderWidth: CGFloat, borderColor: UIColor?, rect: CGRect) {
//        let defaultBorderColor = UIColor.whiteColor()
//        var CGBorderColor: CGColor
//        
//        self.layer.masksToBounds = true
//        
//        if let _ = borderColor {
//            CGBorderColor = borderColor!.CGColor
//        } else {
//            CGBorderColor = defaultBorderColor.CGColor
//        }
//        
//        borderLayer.frame = rect
//        borderLayer.backgroundColor = CGBorderColor
//        self.layer.addSublayer(borderLayer)
//    }
    
}
