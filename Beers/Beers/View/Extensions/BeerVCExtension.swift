//
//  BeerVCExtension.swift
//  Beers
//
//  Created by Vijay B. Singh on 25/09/21.
//

import Foundation
import UIKit
 
extension BeerViewController: BeerViewModelDelegate {
    func didReceivePaginatedBeerResponseFromServer(beerResponse: BeerModel?, error: Error?) {
        if let beerResponse = beerResponse {
            beerObject.append(contentsOf: beerResponse)
            self.srpPageNo += 1
            DispatchQueue.main.async {
                self.tblBeerList.reloadData()
            }
        }
    }
    func didReceiveBeerResponseFromSrever(beerResponse: BeerModel?, error: Error?) {
        if let beerResponse = beerResponse {
            beerObject = beerResponse
            DispatchQueue.main.async {
                self.tblBeerList.reloadData()
            }
        }
        if error != nil {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: Constants.ErrorAlertTitle, message:error?.localizedDescription , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))
                self.present(alert, animated: true)
            }

     }
    }
}

extension BeerViewController: UITableViewDelegate, UITableViewDataSource {
 
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        2//beerObject.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return beerObject.count
        } else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let beerTableCell = tableView.dequeueReusableCell(withIdentifier: "beerTableCell") as! BeerTableViewCell
            beerTableCell.updateCell(beerObj:beerObject[indexPath.row])
            return beerTableCell
        } else {
            let beerTableCell = tableView.dequeueReusableCell(withIdentifier: "loadercellIdentifier") as! LoaderTableViewCell
            tableCurrentOffset = self.tblBeerList.contentOffset
            DispatchQueue.main.async {
                self.beerViewModel.fetchPaginatedBeerResultsFromServer(pageNo: self.srpPageNo)
            }
            return beerTableCell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            DispatchQueue.main.async {
                self.beerElement = self.beerObject[indexPath.row]
                self.performSegue(withIdentifier: "beerdescription", sender: self)
            }
        }
   
    }
}


