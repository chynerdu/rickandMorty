//
//  episodesModel.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 20/11/2023.
//

import Foundation

struct Episodes: Codable{
let results: [Episode]

}

struct Episode: Codable {
    let name: String
    let air_date: String
    let url: String
   
}

struct EpisodeDetails: Codable {
    let name: String
    let air_date: String
    let episode: String
    let created: String
    let characters: [String]
    let url: String
}
