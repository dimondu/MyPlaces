//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 06.09.2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    // MARK: - Public properties
    
    var currentPlace: Place!
    var imageIsChanged = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameTF: UITextField!
    @IBOutlet weak var placeLocationTF: UITextField!
    @IBOutlet weak var placeTypeTF: UITextField!
    
    @IBOutlet weak var ratingControl: RatingControl!
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: tableView.frame.size.width,
                                                         height: 1))
        saveButton.isEnabled = false
        placeNameTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        setupEditScreen()
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        } else {
            view.endEditing(true)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            let identifire = segue.identifier,
            let mapVC = segue.destination as? MapViewController
        else { return }
        
        mapVC.incomeSegueIdentifire = identifire
        mapVC.mapViewControllerDelegate = self
        
        if identifire == "showPlace" {
            mapVC.place.name = placeNameTF.text ?? ""
            mapVC.place.location = placeLocationTF.text
            mapVC.place.type = placeTypeTF.text
            mapVC.place.imageData = placeImage.image?.pngData()
        }
    }
    
    // MARK: - Public methods
    
    func savePlace() {
        
        let image = imageIsChanged ? placeImage.image : #imageLiteral(resourceName: "imagePlaceholder")
        
        let imageData = image?.pngData()
        
        let newPlace = Place(name: placeNameTF.text ?? "",
                             location: placeLocationTF.text,
                             type: placeTypeTF.text,
                             imageData: imageData,
                             rating: Double(ratingControl.rating))
        
        if currentPlace != nil {
            try! realm.write {
                currentPlace?.name = newPlace.name
                currentPlace?.location = newPlace.location
                currentPlace?.type = newPlace.type
                currentPlace?.imageData = newPlace.imageData
                currentPlace?.rating = newPlace.rating
            }
        } else {
            StorageManager.saveObject(newPlace)
        }
    }
    
    private func setupEditScreen() {
        if currentPlace != nil {
            
            setupNavigationBar()
            imageIsChanged = true
            
            guard let data = currentPlace?.imageData, let image = UIImage(data: data) else { return }
            
            placeImage.image = image
            placeImage.contentMode = .scaleAspectFill
            placeNameTF.text = currentPlace?.name
            placeLocationTF.text = currentPlace?.location
            placeTypeTF.text = currentPlace?.type
            ratingControl.rating = Int(currentPlace.rating)
        }
    }
    
    private func setupNavigationBar() {
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        navigationItem.leftBarButtonItem = nil
        title = currentPlace?.name
        saveButton.isEnabled = true
    }
}

// MARK: - Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc private func textFieldChanged() {
        if placeNameTF.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

// MARK: - Work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true)
    }
}

// MARK: - MapViewControllerDelegate

extension NewPlaceViewController: MapViewControllerDelegate {
   
    func gerAddress(_ address: String?) {
        placeLocationTF.text = address
    }
    
    
}
