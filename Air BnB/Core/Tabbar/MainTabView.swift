//
//  MainTabView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            WhishlistView()
                .tabItem { Label("Whishlists", systemImage: "heart") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}
#Preview {
    MainTabView()
}
