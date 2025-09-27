//
//  File.swift
//  map
//
//  Created by давид сарангов on 26.09.2025.
//

import Foundation
import MapKit
struct Location:Identifiable{
        let name:String
    let cityName:String
    let coordinate:CLLocationCoordinate2D
    let description:String
    let imageName:[String]
    let link:String
    var id :String {
        name + cityName
    }
}
