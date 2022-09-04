//
//  MainTableViewController.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 03.09.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Private properties
    
    private let restourantNames = ["Burger Heroes", "Kitchen", "Bonsai",
                                   "Дастархан", "Индокитай", "X.O",
                                   "Балкан Гриль", "Sherlock Holmes",
                                   "Speak Easy", "Morris Pub", "Вкусные истории",
                                   "Классик", "Love&Life", "Шок", "Бочка"]

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restourantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = restourantNames[indexPath.row]
        content.image = UIImage(named: restourantNames[indexPath.row])
        content.imageProperties.cornerRadius = cell.frame.size.height / 2
        cell.contentConfiguration = content

        return cell
    }
 
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
