//
//  SetAchorView.swift
//  CropSearch
//
//  Created by Thenny Chhorn on 9/6/21.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, topPadding: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat, bottomPadding: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
            
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
}
