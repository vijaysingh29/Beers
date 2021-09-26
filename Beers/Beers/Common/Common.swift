//
//  Common.swift
//  Beers
//
//  Created by Vijay B. Singh on 24/09/21.
//

import Foundation
import UIKit
struct Constants {
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    static let PageNo = 1
}

struct ApiEndpoints
{
    static let beer = "https://api.punkapi.com/v2/beers"
    static let beerPage = "https://api.punkapi.com/v2/beers?page="
}
//Fonts
public enum BeerFont {
    //SF UI font
    case GetSFUIMedium(CGFloat)
    case GetSFUIRegular(CGFloat)
    public var font: UIFont {
        switch self {
        case .GetSFUIMedium(let size):   return UIFont(name: "HelveticaNeue-Medium", size: size)!
        case .GetSFUIRegular(let size):   return UIFont(name: "HelveticaNeue", size: size)!
        }
    }
}

