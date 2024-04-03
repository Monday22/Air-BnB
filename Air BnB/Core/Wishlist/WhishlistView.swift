//
//  WhishlistView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI

struct WhishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32.0) {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("Log in to view your whishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlist once you've logged in")
                        .font(.footnote)
                }
                Button {
                    print("Log in")
                } label: {
                    Text("Log In")
                        .foregroundStyle(Color.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360.0, height: 48.0)
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                Spacer()
            }
                .padding()
                .navigationTitle("Whishlist")
        }
    }
}
#Preview {
    WhishlistView()
}
