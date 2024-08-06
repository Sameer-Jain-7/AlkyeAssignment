//
//  ViewController.swift
//  Assignment
//
//  Created by Sameer Jain on 03/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termsLabel.isUserInteractionEnabled = true
        let tapTermsLabel = UITapGestureRecognizer(target: self, action: #selector(termsLabelTapped))
        termsLabel.addGestureRecognizer(tapTermsLabel)
    }
    
    @objc private func termsLabelTapped() {
        if let termsVC = storyboard?.instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController {
            termsVC.modalPresentationStyle = .overCurrentContext
            termsVC.modalTransitionStyle = .crossDissolve
            present(termsVC, animated: true, completion: nil)
        }
    }
}

