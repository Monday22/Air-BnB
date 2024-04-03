//
//  ExploreViewModel.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingCopy = [Listing]()
    init(service: ExploreService) {
        self.service = service
        Task { await fetchListing() }
    }
    func fetchListing() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingCopy = listings
        } catch {
            print("DEBUG: failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        self.listings = filteredListings.isEmpty ? listingCopy : filteredListings
    }
}
