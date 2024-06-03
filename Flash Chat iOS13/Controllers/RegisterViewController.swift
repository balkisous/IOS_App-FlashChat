//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabrl: UILabel!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        print("register button pressed")
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password)
            { authResult, error in
                if let e = error {
                    print("Error from Authentification -> \(e.localizedDescription)")
                    self.errorLabrl.text = e.localizedDescription
                } else {
                    // Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
            
        }
    }
    
}
