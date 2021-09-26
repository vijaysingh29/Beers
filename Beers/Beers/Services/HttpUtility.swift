//
//  File.swift
//  Beers
//
//  Created by Vijay B. Singh on 25/09/21.
//

import Foundation
struct HttpUtility {
    func getApiData<T:Codable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?,  Error?)-> Void) {
        let task = URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                do {
                    let response = try! JSONDecoder().decode(T.self, from: responseData!)
                     completionHandler(response, error)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            } else {
                  completionHandler(nil, error)
            }
        }
        task.resume()
    }
    
}
