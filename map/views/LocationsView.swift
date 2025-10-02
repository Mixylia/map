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



var body: some View {
ZStack {
    Map(coordinateRegion: $viewModel.mapRegion)
        .ignoresSafeArea()
    VStack (spacing: 0){
        header
            .padding()
        
        Spacer()
        ZStack {
            ForEach(viewModel.locations) {location in
                if viewModel.mapLocation.id == location.id {
                    LocationPreviewView(location: location)
                    
                }
                
            }
        }
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
                                .rotationEffect(Angle(degrees:
                                                        viewModel.showListLocation ? 180 : 0))
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



