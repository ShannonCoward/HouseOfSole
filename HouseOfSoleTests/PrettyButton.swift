//
//  PrettyButton.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/9/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

@IBDesignable class PrettyButton: UIButton {
 
    @IBInspectable var cornerRadius: CGFloat = 10
    @IBInspectable var lineThickness: CGFloat = 10
    @IBInspectable var buttonColor: UIColor = UIColor.clearColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let insetRect = CGRectInset(rect, 10, 10)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        let insetPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        
        buttonColor.set()
        
        CGContextAddPath(context, path.CGPath)
        CGContextFillPath(context)
        
        CGContextAddPath(context, insetPath.CGPath)
        CGContextFillPath(context)
    }
}