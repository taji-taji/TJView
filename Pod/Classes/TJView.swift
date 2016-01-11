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
public class TJView: UIView {
    
    private struct Borders {
        private struct Properties {
            private var layer = CALayer()
            private var width: CGFloat = 0
            private var color: UIColor?
        }
        private var top    = Properties()
        private var bottom = Properties()
        private var left   = Properties()
        private var right  = Properties()
    }
    
    private var borders = Borders()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addBorderLayer()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBorderLayer()
    }
    
    // - Top Border Properties

    @IBInspectable
    public var topBorderWidth: CGFloat {
        get {
            return borders.top.layer.frame.size.height
        }
        set {
            let frame = CGRectMake(0.0, 0.0, self.frame.width, newValue)
            borders.top.layer.frame = frame
        }
    }
    
    @IBInspectable
    public var topBorderColor: UIColor? {
        get {
            return borders.top.color
        }
        set {
            if let newValue = newValue {
                borders.top.layer.backgroundColor = newValue.CGColor
                borders.top.color = newValue
            }
        }
    }

    // - Bottom Border Properties

    @IBInspectable
    public var bottomBorderWidth: CGFloat {
        get {
            return borders.bottom.layer.frame.size.height
        }
        set {
            let frame = CGRectMake(0.0, self.frame.height - newValue, self.frame.width, newValue)
            borders.bottom.layer.frame = frame
        }
    }
    
    @IBInspectable
    public var bottomBorderColor: UIColor? {
        get {
            return borders.bottom.color
        }
        set {
            if let newValue = newValue {
                borders.bottom.layer.backgroundColor = newValue.CGColor
                borders.bottom.color = newValue
            }
        }
    }

    // - Left Border Properties
    
    @IBInspectable
    public var leftBorderWidth: CGFloat {
        get {
            return borders.left.layer.frame.size.width
        }
        set {
            let frame = CGRectMake(0.0, 0.0, newValue, self.frame.height)
            borders.left.layer.frame = frame
        }
    }
    
    @IBInspectable
    public var leftBorderColor: UIColor? {
        get {
            return borders.left.color
        }
        set {
            if let newValue = newValue {
                borders.left.layer.backgroundColor = newValue.CGColor
                borders.left.color = newValue
            }
        }
    }

    // - Right Border Properties
    
    @IBInspectable
    public var rightBorderWidth: CGFloat {
        get {
            return borders.right.layer.frame.size.width
        }
        set {
            let frame = CGRectMake(self.frame.width - newValue, 0.0, newValue, self.frame.height)
            borders.right.layer.frame = frame
        }
    }
    
    @IBInspectable
    public var rightBorderColor: UIColor? {
        get {
            return borders.right.color
        }
        set {
            if let newValue = newValue {
                borders.right.layer.backgroundColor = newValue.CGColor
                borders.right.color = newValue
            }
        }
    }
    
    // - Corner Properties
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet {
            self.reLayout()
        }
    }
    
    @IBInspectable
    public var cornerRadiusTopLeft: Bool = false {
        didSet {
            self.reLayout()
        }
    }

    @IBInspectable
    public var cornerRadiusTopRight: Bool = false {
        didSet {
            self.reLayout()
        }
    }

    @IBInspectable
    public var cornerRadiusBottomLeft: Bool = false {
        didSet {
            self.reLayout()
        }
    }

    @IBInspectable
    public var cornerRadiusBottomRight: Bool = false {
        didSet {
            self.reLayout()
        }
    }

    private func addBorderLayer() {
        self.layer.addSublayer(borders.top.layer)
        self.layer.addSublayer(borders.bottom.layer)
        self.layer.addSublayer(borders.left.layer)
        self.layer.addSublayer(borders.right.layer)
    }
    
    private func reLayout() {
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let selfWidth = self.bounds.size.width
        let selfHeight = self.bounds.size.height
        borders.top.layer.frame.size.width = selfWidth
        borders.bottom.layer.frame.size.width = selfWidth
        borders.left.layer.frame.size.height = selfHeight
        borders.right.layer.frame.size.height = selfHeight
        borders.right.layer.frame.origin.x = selfWidth - borders.right.layer.frame.size.width
        
        var corners: UIRectCorner = []
        if cornerRadiusTopLeft {
            corners.insert(.TopLeft)
        }
        if cornerRadiusTopRight {
            corners.insert(.TopRight)
        }
        if cornerRadiusBottomLeft {
            corners.insert(.BottomLeft)
        }
        if cornerRadiusBottomRight {
            corners.insert(.BottomRight)
        }
        cornerRadiusPositions(corners, cornerWidth: self.cornerRadius)
    }
    
    public func borderPositions(positions: [TJViewBorderPosition], borderWidth: CGFloat, borderColor: UIColor?) {
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
    
    public func borderTop(borderWidth: CGFloat, borderColor: UIColor?) {
        topBorderWidth = borderWidth
        topBorderColor = borderColor
    }
    
    public func borderBottom(borderWidth: CGFloat, borderColor: UIColor?) {
        bottomBorderWidth = borderWidth
        bottomBorderColor = borderColor
    }

    public func borderLeft(borderWidth: CGFloat, borderColor: UIColor?) {
        leftBorderWidth = borderWidth
        leftBorderColor = borderColor
    }

    public func borderRight(borderWidth: CGFloat, borderColor: UIColor?) {
        rightBorderWidth = borderWidth
        rightBorderColor = borderColor
    }
    
    public func cornerRadiusPositions(corners: UIRectCorner, cornerWidth: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerWidth, height: cornerWidth)
            ).CGPath
        self.layer.mask = rectShape
    }
    
}
