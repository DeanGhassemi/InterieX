//
//  MenyViewController.swift
//  InterieX
//
//  Created by Maryam Khatib on 2024-04-07.
//  Copyright © 2024 Apple. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    enum MenuOptions: String, CaseIterable {
        case seats = "Seating Area & Chairs"
        case tables = "Tables & Consoles"
        case outdoors = "Outdoors"
        case office = "Office"
        case dining = "Dining Room"
        case accessories = "Accessories"
        
        var imageName : String{
            switch self{
            case .seats:
                return "Icon"
            case .tables:
                return "Icon"
            case .outdoors:
                return "Icon"
            case .office:
                return "Icon"
            case .dining:
                return "Icon"
            case .accessories:
                return "Icon"
            }
        }
    }

    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = nil
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
 let beigeColor = UIColor(red: 240, green: 236, blue: 232, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = beigeColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .black
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.textLabel?.tintColor = .black
        cell.contentView.backgroundColor = beigeColor
        cell.backgroundColor = beigeColor
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
