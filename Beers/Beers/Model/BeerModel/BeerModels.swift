//
//  BeerModel.swift
//  Beers
//
//  Created by Vijay B. Singh on 26/09/21.
//

import Foundation

// MARK: - BeerModelElement
struct BeerModelElement: Codable {
    let id: Int?
    let name, tagline, firstBrewed, beerModelDescription: String?
    let imageURL: String?
    let abv, ibu: Double?
    let targetFg: Int?
    let targetOg: Double?
    let srm: Double?
    let ph, attenuationLevel: Double?
    let volume, boilVolume: BoilVolume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: String?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case beerModelDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case srm = "srm"
        case ph = "ph"
        case attenuationLevel = "attenuation_level"
        case volume = "volume"
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}
// MARK: - BoilVolume
struct BoilVolume: Codable {
    let value: Double?
    let unit: String?
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case unit = "unit"
    }
}

// MARK: - Ingredients
struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

// MARK: - Hop
struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add: String?
    let attribute: String?
}

// MARK: - Malt
struct Malt: Codable {
    let name: String?
    let amount: BoilVolume?
}

// MARK: - Method
struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}
// MARK: - Fermentation
struct Fermentation: Codable {
    let temp: BoilVolume?
}

// MARK: - MashTemp
struct MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Int?
}
typealias BeerModel = [BeerModelElement]
