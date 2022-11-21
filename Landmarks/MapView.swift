//
//  MapView.swift
//  Landmarks
//
//  Created by Sydney Balboni on 11/21/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // @State attribute establishes a source of truth for data in the app
    // that can be modified from any view. SwiftUI manages the storage of
    // the var and automatically updates the views when the value changes.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
        
    var body: some View {
        
        // Prefixing a variable with '$' passes a binding that acts like a
        // reference to the underlying value. 
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
