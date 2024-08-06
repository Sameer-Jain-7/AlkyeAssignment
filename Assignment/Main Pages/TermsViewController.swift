//
//  TermsViewController.swift
//  Assignment
//
//  Created by Rashi Mittal on 07/08/24.
//

import Foundation
import UIKit

class TermsViewController: UIViewController {

    
    @IBOutlet weak var termsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        termsTextView.isEditable = false

//        termsTextView.text = "Your privacy policy content here."
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
