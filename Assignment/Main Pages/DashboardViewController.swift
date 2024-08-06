//
//  DashboardViewController.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HorizontalCollectionViewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HorizontalCollectionViewTableViewCell")
        
        let cardNib = UINib(nibName: "NormalCardTableViewCell", bundle: nil)
        tableView.register(cardNib, forCellReuseIdentifier: "NormalCardTableViewCell")
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
        footerView.backgroundColor = .black
        tableView.tableFooterView = footerView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Hi Indexpathrow ",indexPath.row)
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalCollectionViewTableViewCell", for: indexPath) as! HorizontalCollectionViewTableViewCell
            cell.isSocialMediaRow = false
            return cell
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalCollectionViewTableViewCell", for: indexPath) as! HorizontalCollectionViewTableViewCell
            cell.isSocialMediaRow = true
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCardTableViewCell", for: indexPath) as! NormalCardTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 480
        } else if indexPath.row == 5 {
            return 580
        }else {
            return UITableView.automaticDimension
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let paddingView = UIView()
        paddingView.backgroundColor = .clear
        paddingView.frame = CGRect(x: 0, y: cell.frame.size.height - 10, width: cell.frame.size.width, height: 10)
        cell.addSubview(paddingView)
        
        if let horizontalCell = cell as? HorizontalCollectionViewTableViewCell {
            horizontalCell.isSocialMediaRow = (indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1)
            horizontalCell.collectionView.reloadData()
        }
    }
}
