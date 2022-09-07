//
//  MainTableViewController.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 03.09.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Public properties
    
//    var places = Place.getPlaces()
    

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return places.count
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
//        
////        let place = places[indexPath.row]
//        
//        cell.nameLabel.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        
//        if place.image == nil {
//            cell.imageOfPlace.image = UIImage(named: place.restaurantImage ?? "")
//        } else {
//            cell.imageOfPlace.image = place.image
//        }
//        
//        
//        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
//
//        return cell
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.saveNewPlace()
//        places.append(newPlaceVC.newPlace ?? Place(name: "", location: "", type: "", image: nil, restaurantImage: ""))
        
        tableView.reloadData()
    }
    
}
