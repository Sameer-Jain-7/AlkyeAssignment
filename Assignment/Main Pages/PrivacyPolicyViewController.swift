//
//  PrivacyPolicyViewController.swift
//  Assignment
//
//  Created by Rashi Mittal on 06/08/24.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    
    @IBOutlet weak var privacyPolicyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        privacyPolicyTextView.isEditable = false

//        privacyPolicyTextView.text = "Your privacy policy content here."
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

