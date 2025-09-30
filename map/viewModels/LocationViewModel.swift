//
//  LocationViewModel.swift
//  map
//
//  Created by давид сарангов on 27.09.2025.
//
import MapKit
import Foundation
import SwiftUI
class LocationsViewModel: ObservableObject {
    // Все загруженые локации
    @Published var locations: [Location] = []
    //текущая локация на карте
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    //текущий регион на карте
    @Published var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
    let mapspan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    //показывает список локаций
    @Published var showListLocation:Bool = false
    init () {
        let location = LocationsDataService.locations
        self.locations = location
        self .mapLocation = location.first!
        self .updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion (location :Location) {
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: mapspan)
            
        }
    }
    func togglelocationList() {
        withAnimation(.easeInOut) {
            showListLocation = !showListLocation
        }
    }
    func showNextLocation(location:Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showListLocation = false
        }
        
    }
}
