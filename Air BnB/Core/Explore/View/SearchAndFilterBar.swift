//
//  SearchAndFilterBar.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing: 2.0) {
                Text(location.isEmpty ? "Where To" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere - " : "")Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(Color.gray)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(Color.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10.0)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2.0)
        }
        .padding()
    }
}
#Preview {
    SearchAndFilterBar(location: .constant("Southend"))
}
