//
//  LoginViewController.swift
//  InterieX
//
//  Created by Ahmed Siddiqui on 2024-04-19.
//  Copyright © 2024 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldPassword.isSecureTextEntry = true
        // Do any additional setup after loading the view.
        var toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        var flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        var doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector (doneClicked))
        
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
        textFieldEmail.inputAccessoryView = toolbar
        textFieldPassword.inputAccessoryView = toolbar

    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        ///Perform a login
        
        guard let email = textFieldEmail.text,
              let password = textFieldPassword.text,
              email.count > 0,
              password.count > 0
        else {
            return
        }
        
        ///Do the sign in
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            
            ///Error checking
            if let error = error, user == nil {
                //MARK: - If sign in failed, create an alert
                let alert = UIAlertController(title: "Sign In Failed", message: error.localizedDescription, preferredStyle: .alert)
                
                ///Make the alert show up
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                ///Present the alert
                self.present(alert, animated: true)
            }
        }
    }

}
