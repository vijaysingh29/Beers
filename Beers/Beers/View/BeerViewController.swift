//
//  ViewController.swift
//  Beers
//
//  Created by Vijay B. Singh on 24/09/21.
//

import UIKit

class BeerViewController: UIViewController {
    enum TableSection: Int {
        case beerList
        case loader
    }
    @IBOutlet weak var tblBeerList: UITableView!
    lazy var beerViewModel = BeerViewModel()
    lazy var beerObject = BeerModel()
    var beerElement: BeerModelElement?
    var srpPageNo = Constants.PageNo
    var tableCurrentOffset = CGPoint(x: 0, y: 0)


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        beerViewModel.delegate = self
      fetchBeerDataFromServer()
        
    }
    
    //MARKS: - Api Call func
    func fetchBeerDataFromServer() {
        beerViewModel.fetchServerRequest()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.destination is BeerDescriptionViewController {
                      if let vc = segue.destination as? BeerDescriptionViewController {
                        vc.beerElement = beerElement
                      }
                  }
    }
    
}

