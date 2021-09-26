//
//  BeerDesTableViewCell.swift
//  Beers
//
//  Created by Vijay B. Singh on 26/09/21.
//

import UIKit

class BeerDesTableViewCell: UITableViewCell {
    @IBOutlet weak var beerDesOutletLbl: UILabel!
    @IBOutlet weak var beerDesOutletView: UIView!

     var beerItem: BeerModelElement?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateDesCell(beerElement:BeerModelElement)  {
        beerItem = beerElement
        beerDesOutletLbl.attributedText = beerInfo
    }
    var beerInfo: NSAttributedString? {
        let fullString = NSMutableAttributedString()
        if let name = beerItem?.name {
            let beerName = NSMutableAttributedString(string: "Name: ")
            beerName.addFontORColor(font: BeerFont.GetSFUIMedium(16.0).font , color: UIColor.black)
            fullString.append(beerName)
            let beerNameString = NSMutableAttributedString(string: "\(name)\n\n")
            beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(15.0).font , color: UIColor.black)
            fullString.append(beerNameString)
            //tagline
            if let tagline = beerItem?.tagline {
                let beerName = NSMutableAttributedString(string: "Tagline: ")
                beerName.addFontORColor(font: BeerFont.GetSFUIMedium(16.0).font , color: UIColor.black)
                fullString.append(beerName)
                let beerNameString = NSMutableAttributedString(string: "\(tagline)\n\n")
                beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(15.0).font , color: UIColor.gray)
                fullString.append(beerNameString)
            }
            //beerModelDescription
            if let beerModelDescription = beerItem?.beerModelDescription {
                let beerName = NSMutableAttributedString(string: "Beer Model Description: ")
                beerName.addFontORColor(font: BeerFont.GetSFUIMedium(16.0).font , color: UIColor.black)
                fullString.append(beerName)
                let beerNameString = NSMutableAttributedString(string: "\(beerModelDescription)\n\n")
                beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(15.0).font , color: UIColor.gray)
                fullString.append(beerNameString)
            }
            //brewersTips
            if let brewers_tips = beerItem?.brewersTips {
                let beerName = NSMutableAttributedString(string: "Brewers Tips: ")
                beerName.addFontORColor(font: BeerFont.GetSFUIMedium(16.0).font , color: UIColor.black)
                fullString.append(beerName)
                let beerNameString = NSMutableAttributedString(string: "\(brewers_tips)\n\n")
                beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(15.0).font , color: UIColor.gray)
                fullString.append(beerNameString)
            }
            if let volume = beerItem?.volume?.value, let unit = beerItem?.volume?.unit{
                let beerName = NSMutableAttributedString(string: "Volume: ")
                beerName.addFontORColor(font: BeerFont.GetSFUIMedium(16.0).font , color: UIColor.black)
                fullString.append(beerName)
                let beerNameString = NSMutableAttributedString(string: "\(volume)\(unit)\n\n")
                beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(15.0).font , color: UIColor.gray)
                fullString.append(beerNameString)
            }
            if let contributedBy = beerItem?.contributedBy{
                let beerName = NSMutableAttributedString(string: "ContributedBy: ")
                beerName.addFontORColor(font: BeerFont.GetSFUIMedium(16.0).font , color: UIColor.black)
                fullString.append(beerName)
                let beerNameString = NSMutableAttributedString(string: "\(contributedBy)")
                beerNameString.addFontORColor(font: BeerFont.GetSFUIRegular(15.0).font , color: UIColor.gray)
                fullString.append(beerNameString)
            }
           
        }
        return fullString

    }
}
