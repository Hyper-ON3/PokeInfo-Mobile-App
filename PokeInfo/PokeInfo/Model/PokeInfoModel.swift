//
//  PokeInfoModel.swift
//  PokeInfo
//
//  Created by Aleksey Kotsevych on 26/12/2022.
//

import Foundation

struct PokeInfoModel: Codable {
    //let token: String
    let data: [Info]
}

// MARK: - Datum
struct Info: Codable {
    let name, datumDescription, category: String
    let abilities, type, weaknesses: [String]
    let height, weight: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case name
        case datumDescription = "description "
        case category, abilities, type, weaknesses, height, weight, image
    }
}
