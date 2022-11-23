//
//  ModelData.swift
//  Landmarks
//
//  Created by Sydney Balboni on 11/22/22.
//

import Foundation
import Combine

// SwiftUI subscribes to ObservableObject and automatically updates
// the views that need refreshing when the data changes
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load(filename: "landmarkData.json")
}

func load<T: Decodable>(filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Coouldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
