//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 07.09.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place){
        
        try! realm.write{
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        try! realm.write{
            realm.delete(place)
        }
    }
}
