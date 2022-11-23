//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sydney Balboni on 11/22/22.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }
    
    var body: some View {
        
        // Lists work with identifiable data. You can make data
        // identifiable by passing in a key with the data or
        // by making the data type conform to the Identifiable
        // protocol.
        // List(landmarks, id: \.id) { landmark in
        //     LandmarkRow(landmark: landmark)
        // }
        
        // Adding the Identifiable protocol to Landmark.swift
        // allows you to simplify the syntax
        NavigationView {
            
            List {
                // $ prefix is used to access a binding to a state
                // variable or one of its properties
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
