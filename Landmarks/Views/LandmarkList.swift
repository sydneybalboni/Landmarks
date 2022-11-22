//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sydney Balboni on 11/22/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        // Lists work with identifiable data. You can make data
        // identifiable by passing in a key with the data or
        // by making the data type conform to the Identifiable
        // protocol.
        //List(landmarks, id: \.id) { landmark in
        //    LandmarkRow(landmark: landmark)
        //}
        
        // Adding the Identifiable protocol to Landmark.swift
        // allows you to simplify the syntax
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
