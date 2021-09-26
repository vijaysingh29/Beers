//
//  AttributedStringExtension.swift
//  Beers
//
//  Created by Vijay B. Singh on 26/09/21.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
     func addFontORColor(font:UIFont?, color: UIColor?) {
        if let _ = color {
            let colorAttribute = [NSAttributedString.Key.foregroundColor : color!]
            self.addAttributes(colorAttribute, range: NSMakeRange(0, self.length))
        }
        if let _ = font {
            let fontAttribute =  [NSAttributedString.Key.font : font!]
            self.addAttributes(fontAttribute, range: NSMakeRange(0, self.length))
        }
    }
}
