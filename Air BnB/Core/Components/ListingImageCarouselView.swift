//
//  ListingImageCarouselView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    var body: some View {
        TabView {
            ForEach(listing.imageURLS, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}
#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
