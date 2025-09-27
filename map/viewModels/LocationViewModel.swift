//
//  LocationViewModel.swift
//  map
//
//  Created by давид сарангов on 27.09.2025.
//

import Foundation
class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    init () {
        let location = LocationsDataService.locations
        self.locations = location
    }
}
