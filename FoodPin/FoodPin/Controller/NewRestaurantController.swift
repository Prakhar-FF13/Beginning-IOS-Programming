//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by Prakhar Kumar on 30/03/21.
//

import UIKit

class NewRestaurantController: UITableViewController {

    @IBOutlet var nameTextField: RoundedTextField! {
        didSet {
            nameTextField.tag = 1;
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self;
        }
    }
    
    @IBOutlet var typeTextField: RoundedTextField! {
        didSet {
            typeTextField.tag = 2;
            typeTextField.delegate = self;
        }
    }
    
    @IBOutlet var addressTextField: RoundedTextField! {
        didSet {
            addressTextField.tag = 3;
            addressTextField.delegate = self;
        }
    }
    
    @IBOutlet var phoneTextField: RoundedTextField! {
        didSet {
            phoneTextField.tag = 4;
            phoneTextField.delegate = self;
        }
    }
    
    @IBOutlet var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.tag = 5;
            descriptionTextView.layer.cornerRadius = 10.0;
            descriptionTextView.layer.masksToBounds = true;
        }
    }
    
    @IBOutlet var photoImageView: UIImageView! {
        didSet {
            photoImageView.layer.cornerRadius = 10.0
            photoImageView.layer.masksToBounds = true
        }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem!) {
        var allOk: Bool = true;
        if let nameText = nameTextField.text {
            allOk = allOk && !nameText.isEmpty;
        }
        
        if let typeText = typeTextField.text {
            allOk = allOk && !typeText.isEmpty;
        }
        
        if let addressText = addressTextField.text {
            allOk = allOk && !addressText.isEmpty;
        }
        
        if let phoneText = phoneTextField.text {
            allOk = allOk && !phoneText.isEmpty;
        }
        
        if let addressText = addressTextField.text {
            allOk = allOk && !addressText.isEmpty;
        }
        
        if let descriptionText = descriptionTextView.text {
            allOk = allOk && !descriptionText.isEmpty;
        }
        
        if (allOk == false) {
            let wrongInputController = UIAlertController(title: "", message: "One of the inputs was left empty.", preferredStyle: .alert);
            
            self.present(wrongInputController, animated: true, completion: {
                self.dismiss(animated: true , completion: nil);
            });
        } else {
            print("All ok");
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appearance = navigationController?.navigationBar.standardAppearance {
            if let customFont = UIFont(name: "Nunito-Bold", size: 40.0) {
                appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }
            
            navigationController?.navigationBar.standardAppearance = appearance;
            
            navigationController?.navigationBar.compactAppearance = appearance;
            
            navigationController?.navigationBar.scrollEdgeAppearance = appearance;
        }
        
        let margins = photoImageView.superview!.layoutMarginsGuide
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false;
        
        photoImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true;
        
        photoImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true;
        
        photoImageView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true;
        
        photoImageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true;
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap);
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet);
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                (action) in
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        let imagePicker = UIImagePickerController()
                        imagePicker.allowsEditing = false
                        imagePicker.sourceType = .camera
                        
                        imagePicker.delegate = self;

                        self.present(imagePicker, animated: true, completion: nil)
                    }
            });
            
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: { (action) in
                        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                            let imagePicker = UIImagePickerController()
                            imagePicker.allowsEditing = false
                            imagePicker.sourceType = .photoLibrary
                            
                            imagePicker.delegate = self

                            self.present(imagePicker, animated: true, completion: nil)
                        }
            });
            
            photoSourceRequestController.addAction(cameraAction);
            
            photoSourceRequestController.addAction(photoLibraryAction);
            
            // for ipad.
            
            if let popoverController = photoSourceRequestController.popoverPresentationController {
                
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell;
                    popoverController.sourceRect = cell.bounds;
                }
            }
            
            present(photoSourceRequestController, animated: true, completion: nil);
        }
    }

}

extension NewRestaurantController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder();
            nextTextField.becomeFirstResponder();
        }
        
        return true;
    }
}

extension NewRestaurantController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                photoImageView.image = selectedImage
                photoImageView.contentMode = .scaleAspectFill
                photoImageView.clipsToBounds = true
            }

            dismiss(animated: true, completion: nil)
        }
}
