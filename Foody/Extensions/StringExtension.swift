//
//  StringExtension.swift
//  Foody
//
//  Created by Fatima Zahra SEDKI on 22/9/2023.
//

import Foundation


extension String{
    
    var asUrl : URL?{
        return URL(string: self)
    }
    
}

