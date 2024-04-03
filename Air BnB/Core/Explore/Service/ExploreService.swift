//
//  ExploreService.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
