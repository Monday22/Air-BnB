//
//  ListingView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8.0) {
            // Images
            ListingImageCarouselView(listing: listing)
                .frame(height: 320.0)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            // listing Details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.black)
                    Text("12 mi away")
                        .foregroundStyle(Color.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(Color.gray)
                    HStack(spacing: 4.0) {
                        Text("£\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(Color.black)
                }
                Spacer()
                // ratings
                HStack(spacing: 2.0) {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
                .foregroundStyle(Color.black)
            }
            .font(.footnote)
        }
    }
}
#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
