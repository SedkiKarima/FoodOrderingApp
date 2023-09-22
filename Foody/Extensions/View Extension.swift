//
//  View Extension.swift
//  Foody
//
//  Created by Fatima Zahra SEDKI on 10/9/2023.
//

import UIKit


extension UIView {
    
  @IBInspectable  var cornerRadius:CGFloat {
        
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
