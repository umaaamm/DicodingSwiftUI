//
//  DetailGamesModel.swift
//  DicodingSwiftUI
//
//  Created by Kurniawan Gigih Lutfi Umam on 17/08/20.
//  Copyright © 2020 Kurniawan Gigih Lutfi Umam. All rights reserved.
//

import Foundation

// MARK: - DetailGamesModel
struct DetailGamesModel: Codable, Identifiable {
    let id: Int?
    let slug, name, nameOriginal, description: String?
    let released: String?
    let updated: String?
    let backgroundImage: String?
    let backgroundImageAdditional: String?
    let rating: Double?
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int?
    let achievementsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal
        case description
        case released, updated
        case backgroundImage
        case backgroundImageAdditional
        case rating
        case playtime
        case screenshotsCount
        case moviesCount
        case creatorsCount
        case achievementsCount
    }
}
