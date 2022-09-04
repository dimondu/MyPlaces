//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 04.09.2022.
//

import Foundation

struct Place {
    
    let name: String
    let location: String
    let type: String
    let image: String
    
    static let restourantNames = ["Burger Heroes", "Kitchen", "Bonsai",
                                   "Дастархан", "Индокитай", "X.O",
                                   "Балкан Гриль", "Sherlock Holmes",
                                   "Speak Easy", "Morris Pub", "Вкусные истории",
                                   "Классик", "Love&Life", "Шок", "Бочка"]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restourantNames {
            places.append(Place(name: place, location: "Тотьма", type: "Бар", image: place))
        }
        
        return places
    }
}
