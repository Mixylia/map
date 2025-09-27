//
//  mapApp.swift
//  map
//
//  Created by давид сарангов on 26.09.2025.
//

import SwiftUI

@main
struct mapApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
