//
//  CustomTableViewCell.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 04.09.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageOfPlace: UIImageView! {
        didSet {
            imageOfPlace.layer.cornerRadius = imageOfPlace.frame.size.height / 2
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
}
