//
//  Error.swift
//  RickAndMorty
//
//  Created by Chinedu Uche on 29/11/2023.
//

import Foundation


enum API_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
    case CANNOT_PARSE_JSON_DATA
    case cannotCreateURLComponent
}
