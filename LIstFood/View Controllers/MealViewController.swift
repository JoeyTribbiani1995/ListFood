//
//  ViewController.swift
//  LIstFood
//
//  Created by Dũng Võ on 3/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class MealViewController: UIViewController ,UITextFieldDelegate ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    
    var meal : Meal?
    
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mealNameTextField.delegate = self
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //hide the keyboard
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @IBAction func selectImagePhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        mealNameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("error \(info)")
        }
        
        photoImageView.image = selectImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func updateView(){
        if let meal = meal {
            mealNameLabel.text = meal.name
            ratingControl.rating = meal.rating
            if let photo = meal.photo {
                photoImageView.image = UIImage(named: photo)
            }else{
                photoImageView.image = UIImage(named: "image")
            }
        }
    }
    
    
}
