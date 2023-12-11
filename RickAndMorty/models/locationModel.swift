//
//  locationModel.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 20/11/2023.
//

import Foundation

struct Locations: Codable{
let results: [Location]

}

struct Location: Codable {
    let name: String
    let type: String
    let url: String
   
}

struct LocationDetails: Codable {
    let name: String
    let type: String
    let dimension: String
    let created: String
    let residents: [String]
    let url: String
    
}
