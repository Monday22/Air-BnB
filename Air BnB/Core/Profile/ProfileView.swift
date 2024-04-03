//
//  ProfileView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Profile login View
            VStack(alignment: .leading, spacing: 32.0) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Login to start planning your next trip")
                }
                Button {
                    print("Login")
                } label: {
                    Text("Login")
                        .foregroundStyle(Color.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360.0, height: 48)
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                HStack {
                    Text("Don't have an account")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            // Profile Options
            VStack(spacing: 24.0) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}
#Preview {
    ProfileView()
}
