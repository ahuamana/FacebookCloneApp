//
//  ViewController.swift
//  Aprendiendo
//
//  Created by Antony Huaman Alikhan on 16/12/23.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {
    //MARK: - Referencias UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
      
        
        guard let email = emailTextField.text, !email.isEmpty else {
            print("empty email")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty  else {
            print("empty passs")
            return
        }
        
        if email == "carlos@gmail.com", password == "123" {
            //handle saved email
            if emailSwitch.isOn {
                //Here we saved values in the user defaults
                storage.set(email, forKey: emailKey)
            } else {
                storage.removeObject(forKey: emailKey)
            }
            print("Bienvenido")
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            showErrorDialog()
        }
        
    }
    
    private let emailKey = "KEY_EMAIL"
    private let storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // De esta manera buscamos valores en los UserDefaults
        
        if let storageEmail = storage.string(forKey: emailKey) {
            emailTextField.text = storageEmail
            emailSwitch.isOn = true
        } else {
        
            emailSwitch.isOn = false
        }
        
        
    }
    
    private func showErrorDialog() {
        // Prepare the popup assets
        let title = "ERROR"
        let message = "Credenciales invalidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }


}

