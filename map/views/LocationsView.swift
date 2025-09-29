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
        header
         .padding()
         
        Spacer()
    }
 
}
}
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
extension LocationsView {
    private var header:some View {
        VStack {
            Button(action: viewModel.togglelocationList) {
                
                    Text(viewModel.mapLocation.name + "  " + viewModel.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame( height: 55)
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                        }
                
               
                
            }
            if viewModel.showListLocation {
                LocationListView()
                    
            }
            
            
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20 , x:0, y:15)
        
    }
    
}
