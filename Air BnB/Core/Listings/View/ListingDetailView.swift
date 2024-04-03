//
//  ListingDetailView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPostion: MapCameraPosition
    init(listing: Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(center: listing.city == "SandHurst" ? .sandhurst : .southend, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPostion = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320.0)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                        .background {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 32.0, height: 32.0)
                        }
                        .padding(32.0)
                }
            }
            VStack(alignment: .leading, spacing: 8.0) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading) {
                    HStack(spacing: 2.0) {
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(Color.black)
                    Text("\(listing.city) \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            // host info view
            HStack {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250.0, alignment: .leading)
                    HStack {
                        Text("\(listing.numberOfGuests) guest -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300.0, alignment: .leading)
                Spacer()
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64.0, height: 64.0)
                    .clipShape(Circle())
            }
            .padding()
            Divider()
            // Listing Features
            VStack(alignment: .leading, spacing: 16.0) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 2.0) {
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading) {
                            Text(listing.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            // Bedrooms View
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16.0) {
                        ForEach(1 ... listing.numberOfBedrooms, id:\.self) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132.0, height: 100.0)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12.0)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            Divider()
            // listing amenties
            VStack(alignment: .leading, spacing: 16.0) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32.0)
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Where you'll be")
                    .font(.headline)
                Map(position: $cameraPostion)
                    .frame(height: 200.0)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 72.0)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total befor taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(Color.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140.0, height: 40.0)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    }
                }
                .padding(.horizontal, 32.0)
            }
            .background(Color.white)
        }
    }
}
#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[1])
}
