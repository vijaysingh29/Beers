//
//  BeerDescriptionViewController.swift
//  Beers
//
//  Created by Vijay B. Singh on 26/09/21.
//

import UIKit

class BeerDescriptionViewController: UIViewController {

    var beerElement: BeerModelElement?
    @IBOutlet weak var beerDesTbl:UITableView!
    @IBOutlet weak var beerImageOutletImageV:LazyImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadBeerImage()
     
    }
    
    func loadBeerImage(){
        guard let beerImageUrl = URL(string:beerElement?.imageURL ?? "") else { return  }
            beerImageOutletImageV.loadImage(fromURL: beerImageUrl, placeHolderImage: "")
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
