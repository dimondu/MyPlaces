//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 04.09.2022.
//

import RealmSwift
import UIKit

class Place: Object {
    
    @Persisted var name = ""
    @Persisted var location: String?
    @Persisted var type: String?
    @Persisted var imageData: Data?
    
    let restourantNames = ["Burger Heroes", "Kitchen", "Bonsai",
                                  "Дастархан", "Индокитай", "X.O",
                                  "Балкан Гриль", "Sherlock Holmes",
                                  "Speak Easy", "Morris Pub", "Вкусные истории",
                                  "Классик", "Love&Life", "Шок", "Бочка"]
    
    func savePlaces() {
        
        for place in restourantNames {
            
            let image = UIImage(named: place)
            
            guard let imageData = image?.pngData() else { return }
           
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Ufa"
            newPlace.type = "Bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
        }
    }
}
