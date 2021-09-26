//
//  BeerViewModel.swift
//  Beers
//
//  Created by Vijay B. Singh on 25/09/21.
//

import Foundation
protocol BeerViewModelDelegate {
   func didReceiveBeerResponseFromSrever(beerResponse: BeerModel?, error: Error?)
    func didReceivePaginatedBeerResponseFromServer(beerResponse: BeerModel?, error: Error?)
}
struct BeerViewModel
{
    var delegate : BeerViewModelDelegate?
    var beerResource = BeerResources()
    
    func fetchServerRequest() {
        beerResource.fetchResultsFromServer { (beerResponse, error) in
            DispatchQueue.main.async {
                self.delegate?.didReceiveBeerResponseFromSrever(beerResponse: beerResponse,error: error)
            }
        }
    }
    func fetchPaginatedBeerResultsFromServer(pageNo:Int) {
        beerResource.fetchPaginatedResultsFromServer(numberOfPage:pageNo) { (beerResponse, error) in
            DispatchQueue.main.async {
                self.delegate?.didReceivePaginatedBeerResponseFromServer(beerResponse: beerResponse, error: error)
            }
            
        }
    
    }
}
