//
//  LocationsView.swift
//  map
//
//  Created by давид сарангов on 27.09.2025.
//

import SwiftUI
import MapKit

struct LocationsView: View {

@EnvironmentObject var viewModel: LocationsViewModel

@State private var mapRegion = MapCameraPosition.region(MKCoordinateRegion(
    center: CLLocationCoordinate2DMake(41.8902, 12.4922),
span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
))

var body: some View {
ZStack {
    Map(position:$mapRegion)
        .ignoresSafeArea()
    VStack (spacing: 0){
        Text(vm.mapLocation.name  + vm.mapLocation.cityName)
    }
}
}
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
