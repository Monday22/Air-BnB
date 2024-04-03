//
//  DeveloperPreview.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import Foundation

struct DeveloperPreview {
    static let shared = DeveloperPreview()
    var listings: [Listing] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              ownerName: "Anthony K Lartey",
              ownerImageUrl: "male-profile-photo",
              numberOfBedrooms: 4,
              numberOfBathrooms: 3,
              numberOfGuests: 4,
              numberOfBeds: 4,
              pricePerNight: 567,
              latitude: 25.7888,
              longitude: -80.1936, 
              imageURLS: ["listing-1", "listing-2", "listing-3", "listing-4"],
              address: "123 Main St",
              city: "SandHurst",
              state: "Florida",
              title: "Miami Villa",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
              type: .villa),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              ownerName: "Monday K Lartey",
              ownerImageUrl: "male-profile-photo",
              numberOfBedrooms: 4,
              numberOfBathrooms: 3,
              numberOfGuests: 4,
              numberOfBeds: 4,
              pricePerNight: 567,
              latitude: 25.7706,
              longitude: -80.1340, 
              imageURLS: ["listing-2", "listing-4", "listing-3", "listing-1"],
              address: "123 Cedar Ward St",
              city: "Southend",
              state: "Florida",
              title: "Cedar Ward",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
              type: .villa),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              ownerName: "Ebow K Lartey",
              ownerImageUrl: "male-profile-photo",
              numberOfBedrooms: 4,
              numberOfBathrooms: 3,
              numberOfGuests: 4,
              numberOfBeds: 4,
              pricePerNight: 567,
              latitude: 25.7650,
              longitude: -80.1936, 
              imageURLS: ["listing-4", "listing-3", "listing-1", "listing-2"],
              address: "123 Devon St",
              city: "SandHurst",
              state: "Florida",
              title: "Miami Villa",
              rating: 4.86,
              features: [.selfCheckIn, .superHost],
              amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
              type: .villa)
    
    ]
}
