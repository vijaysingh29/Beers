//
//  BeerDescriptionVCExtension.swift
//  Beers
//
//  Created by Vijay B. Singh on 26/09/21.
//

import Foundation
import UIKit

extension BeerDescriptionViewController: UITableViewDelegate,UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beerTableCell = tableView.dequeueReusableCell(withIdentifier: "beerDesIdentifier") as! BeerDesTableViewCell
        if let beerElement = beerElement{
            beerTableCell.updateDesCell(beerElement: beerElement)
        }
        return beerTableCell
    }
  
    
}
