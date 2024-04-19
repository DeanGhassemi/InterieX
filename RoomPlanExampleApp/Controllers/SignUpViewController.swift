//
//  SignUpViewController.swift
//  InterieX
//
//  Created by Ahmed Siddiqui on 2024-04-19.
//  Copyright © 2024 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet var textFieldFullName: UITextField!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldConfirmEmail: UITextField!
    @IBOutlet var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldPassword.isSecureTextEntry = true
        var toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        var flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        var doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector (doneClicked))
        
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
        textFieldFullName.inputAccessoryView = toolbar
        textFieldEmail.inputAccessoryView = toolbar
        textFieldConfirmEmail.inputAccessoryView = toolbar
        textFieldPassword.inputAccessoryView = toolbar

    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
        
        guard let fullName = textFieldFullName.text,
        let email = textFieldEmail.text,
        let password = textFieldPassword.text
        else {
            return
        }
            
            ///Sign up -> create a user
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                
                if error == nil {
                    Auth.auth().signIn(withEmail: self.textFieldEmail.text!, password: self.textFieldPassword.text!)
                }
            }
        }
}
