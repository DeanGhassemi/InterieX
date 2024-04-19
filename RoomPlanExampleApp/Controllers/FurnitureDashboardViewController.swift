//
//  FurnitureDashboardViewController.swift
//  InterieX
//
//  Created by Maryam Khatib on 2024-04-07.
//  Copyright © 2024 Apple. All rights reserved.
//

import UIKit

protocol FurnitureDashboardViewControllerDelegate : AnyObject{
    func didTapMenuButton()
}

class FurnitureDashboardViewController: UIViewController {
    
   // let menuVC = MenuViewController()
    weak var delegate: FurnitureDashboardViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Furniture Dashboard"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
                                              image: UIImage(systemName: "list.dash"),
                                              style: .done,
                                              target: self,
                                              action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
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
