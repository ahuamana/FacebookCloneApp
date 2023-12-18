//
//  ViewController.swift
//  Aprendiendo
//
//  Created by Antony Huaman Alikhan on 16/12/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Referencias UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
            print("Bienvenido")
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("Credenciles incorrectas")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view..
    
    }


}

