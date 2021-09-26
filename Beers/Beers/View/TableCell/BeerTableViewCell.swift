//
//  BeerTableViewCell.swift
//  Beers
//
//  Created by Vijay B. Singh on 25/09/21.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    @IBOutlet weak var beerNameOutletLbl: UILabel!
    @IBOutlet weak var beerTaglineOutletLbl: UILabel!
    @IBOutlet weak var beerImageOutletImgView: LazyImageView!
    @IBOutlet weak var beerViewOutletView: UIView!

    var beerElement: BeerModelElement?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.beerViewOutletView.layer.cornerRadius = 6
        self.beerViewOutletView.layer.borderWidth = 1.0

        self.beerViewOutletView.layer.borderColor = UIColor.clear.cgColor
        self.beerViewOutletView.layer.masksToBounds = true

        beerViewOutletView.layer.shadowColor = UIColor.gray.cgColor
        beerViewOutletView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        beerViewOutletView.layer.shadowRadius = 2.0
        beerViewOutletView.layer.shadowOpacity = 1.0
        beerViewOutletView.layer.masksToBounds = false
        beerViewOutletView.layer.shadowPath = UIBezierPath(roundedRect:beerViewOutletView.bounds, cornerRadius:beerViewOutletView.layer.cornerRadius).cgPath
    }
    // Mark:- Update cell func
    
    func updateCell(beerObj: BeerModelElement) {
        beerElement = beerObj
        if let name  = beerName {
            beerNameOutletLbl.attributedText = name
        }
        if let tagline = beerTagline {
            beerTaglineOutletLbl.attributedText =  tagline
        }
        guard let beerImageUrl = URL(string:beerObj.imageURL ?? "") else { return  }
        beerImageOutletImgView.loadImage(fromURL:beerImageUrl, placeHolderImage:"beer" )
    }
    
    var beerName: NSAttributedString? {
        let fullString = NSMutableAttributedString()
        if let name = beerElement?.name {
            let beerName = NSMutableAttributedString(string: "Name: ")
            beerName.addFontORColor(font: BeerFont.GetSFUIMedium(14.0).font , color: UIColor.black)
            fullString.append(beerName)
            let beerNameString = NSMutableAttributedString(string: "\(name)")
            beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(13.0).font , color: UIColor.black)
            fullString.append(beerNameString)
            }
        return fullString

    }
    var beerTagline: NSAttributedString? {
        let fullString = NSMutableAttributedString()
        if let tagline = beerElement?.tagline {
            let beerName = NSMutableAttributedString(string: "Tagline: ")
            beerName.addFontORColor(font: BeerFont.GetSFUIMedium(14.0).font , color: UIColor.black)
            fullString.append(beerName)
            let beerNameString = NSMutableAttributedString(string: "\(tagline)")
            beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(13.0).font , color: UIColor.black)
            fullString.append(beerNameString)
            }
        return fullString
    }

}
