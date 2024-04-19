//
//  ContainerMenuAndFurnitureDashboard.swift
//  InterieX
//
//  Created by Maryam Khatib on 2024-04-07.
//  Copyright © 2024 Apple. All rights reserved.
//

import UIKit


class ContainerMenuAndFurnitureDashboard: UIViewController {

    //state of side menu
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState : MenuState = .closed //by default menu should be closed
    
    let menuVC = MenuViewController()
    let furnitureDashboardVC = FurnitureDashboardViewController()
    var navVC : UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVCs()
    }
    

    private func addChildVCs(){
        //Meny
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        //Furniture Dashboard
        let navVC = UINavigationController(rootViewController: furnitureDashboardVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }

}

extension ContainerMenuAndFurnitureDashboard :FurnitureDashboardViewControllerDelegate {
    func didTapMenuButton(){
        //Animate the menu
        switch menuState {
        case .closed: //open it
            UIView.animate(withDuration: 0.5 , delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.furnitureDashboardVC.view.frame.size.width - 100
                
            } completion: { [weak self] done in
                if done{
                    self?.menuState = .opened
                }
            }
        case .opened: //close it
            UIView.animate(withDuration: 0.5 , delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
                
            } completion: { [weak self] done in
                if done{
                    self?.menuState = .closed
                }
            }
        }
    }
}

