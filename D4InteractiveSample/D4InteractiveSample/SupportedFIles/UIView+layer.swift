//
//  UIView+layer.swift
//
//  Created by Hamza Mughal on 17/10/2021.
//

import UIKit

extension UIButton
{
    func CurveButton(corner: CGFloat){
            self.layer.cornerRadius = corner
            self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
       }
    
    func curvePlus(corner: CGFloat)
    {
        self.layer.cornerRadius = corner
        self.layer.maskedCorners = .layerMinXMinYCorner
    }
    
    func curveMinus(corner: CGFloat)
    {
        self.layer.cornerRadius = corner
        self.layer.maskedCorners = .layerMaxXMaxYCorner
    }
}

// MARK: - UIView Shadow
extension UIView {
    
    func CurveViewsTop(corner: CGFloat){
         self.layer.cornerRadius = corner
         self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            guard let color = layer.shadowColor else {
                return .clear
            }
            return UIColor(cgColor: color)
        }
        
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    
}


// MARK: - UIView Border
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            guard let color = layer.borderColor else {
                return .clear
            }
            return UIColor(cgColor: color)
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

// MARK: - Shadow helper All-in-One
extension UIView {
    
    func setShadowWith(color: UIColor, opacity: Float, offsetWidth: CGFloat, offsetHeight: CGFloat, radius: CGFloat) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        self.layer.shadowRadius = radius
    }
    
    func addDashedBorder(boardcolor:UIColor = UIColor.black) {
        let color = boardcolor.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
}


// MARK: - Letter space for label -

extension UILabel {
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }

            attributedString.addAttribute(NSAttributedString.Key.kern,
                                           value: newValue,
                                           range: NSRange(location: 0, length: attributedString.length))

            attributedText = attributedString
        }

        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}
