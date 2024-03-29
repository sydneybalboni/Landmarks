//
//  CircleImage.swift
//  Landmarks
//
//  Created by Sydney Balboni on 11/21/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
