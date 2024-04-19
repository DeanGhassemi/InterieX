//
//  HomeViewController.swift
//  InterieX
//
//  Created by Dean Ghassemi on 2024-04-18.
//  Copyright © 2024 Apple. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
      

class HomeViewController: UIViewController {
    
    @IBOutlet weak var furnitureCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        /*
        // Create a root reference
        let storageRef = storage.reference()

        // Create a reference to "mountains.jpg"
        let mountainsRef = storageRef.child("mountains.jpg")

        // Create a reference to 'images/mountains.jpg'
        let mountainImagesRef = storageRef.child("images/mountains.jpg")

        // While the file names are the same, the references point to different files
        mountainsRef.name == mountainImagesRef.name            // true
        mountainsRef.fullPath == mountainImagesRef.fullPath    // false
         */
            
        // Furniture Loading Images
        /*
        var ref: DatabaseReference!
        val db = Firebase.firestore
        ref = Database.database().reference()
        */
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
