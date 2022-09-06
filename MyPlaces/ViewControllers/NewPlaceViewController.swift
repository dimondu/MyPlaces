//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 06.09.2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

// MARK: - Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
