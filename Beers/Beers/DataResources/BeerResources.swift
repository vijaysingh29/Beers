//
//  BeerResources.swift
//  Beers
//
//  Created by Vijay B. Singh on 25/09/21.
//

import Foundation
struct BeerResources {
    func fetchResultsFromServer(completion : @escaping (_ result: BeerModel?, Error?) -> Void)
    {
        let beerUrl = URL(string: ApiEndpoints.beer)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: beerUrl, resultType: BeerModel.self) { (beermodelResponse, error) in
            if((error) != nil){
                 completion(nil,error)
            } else {
                 completion(beermodelResponse, nil)
            }
        }
    }
    func fetchPaginatedResultsFromServer( numberOfPage: Int, completion : @escaping (_ result: BeerModel?, Error?) -> Void){
        let urlStr =  "\(ApiEndpoints.beerPage)\(numberOfPage)"
        let beerUrl = URL(string: urlStr)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: beerUrl, resultType: BeerModel.self) { (beermodelResponse, error) in
            if((error) != nil){
                 completion(nil,error)
            } else {
                completion(beermodelResponse, nil)
            }
        }
    }
}





