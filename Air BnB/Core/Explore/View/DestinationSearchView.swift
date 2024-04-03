//
//  DestinationSearchView.swift
//  Air BnB
//
//  Created by Anthony Lartey on 03/04/2024.
//

import SwiftUI
import PhotosUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest = 0
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(Color.black)
                }
                Spacer()
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(Color.black)
                    .font(.subheadline)
                    .fontWeight(Font.Weight.semibold)
                }
            }
            .padding()
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44.0)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsePickerView(title: "Where", description: "Add destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120.0 : 64.0)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            // date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(Color.gray)
                    .font(.subheadline)
                    .fontWeight(Font.Weight.semibold)
                } else {
                    CollapsePickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 200.0 : 64.0)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            // number guest view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(Font.Weight.semibold)
                    Stepper {
                        Text("\(numGuest) Adults")
                    } onIncrement: {
                        numGuest += 1
                    } onDecrement: {
                        guard numGuest > 0 else { return }
                        numGuest -= 1
                    }
                } else {
                    CollapsePickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120.0 : 64.0)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            Spacer()
        }
    }
}
#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding()
            .shadow(radius: 10.0)
    }
}


struct CollapsePickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(Color.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(Font.Weight.semibold)
            .font(.subheadline)
        }
    }
}
