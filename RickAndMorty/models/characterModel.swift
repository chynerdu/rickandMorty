//
//  characterModel.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 20/11/2023.
//

import Foundation



struct Characters: Codable{
let results: [Character]

}

struct Character: Codable {
    let name: String
    let status: String
    let species: String
    let url: String
    
}

struct CharacterDetails: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let url: String
    
}
