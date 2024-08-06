//
//  SignUpViewController.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var YourNameTextField: FloatingLabelTextField!
    @IBOutlet weak var YourEmailTextField: FloatingLabelTextField!
    @IBOutlet weak var PasswordTextField: FloatingLabelTextField!
    
    @IBOutlet weak var HaveAnAccountLabel: UILabel!
    @IBOutlet weak var privacyPolicyLabel: UILabel!
    
    private let showPasswordButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPasswordField()
        HaveAnAccountLabel.isUserInteractionEnabled = true
        let tapHaveAnAccountLabel = UITapGestureRecognizer(target: self, action: #selector(haveAnAccountLabelTapped))
        HaveAnAccountLabel.addGestureRecognizer(tapHaveAnAccountLabel)
        
        privacyPolicyLabel.isUserInteractionEnabled = true
        let tapPrivacyPolicyLabel = UITapGestureRecognizer(target: self, action: #selector(privacyPolicyLabelTapped))
        privacyPolicyLabel.addGestureRecognizer(tapPrivacyPolicyLabel)
    }
    
    func setupPasswordField() {
        PasswordTextField.isSecureTextEntry = true
        showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        showPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        showPasswordButton.tintColor = UIColor.black
        showPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        PasswordTextField.rightView = showPasswordButton
        PasswordTextField.rightViewMode = .always
    }
    
    @objc private func togglePasswordVisibility() {
        PasswordTextField.isSecureTextEntry.toggle()
        showPasswordButton.isSelected.toggle()
    }
    
    @objc private func haveAnAccountLabelTapped() {
        if let accountExist = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            navigationController?.popViewController(animated: true)
            navigationController?.pushViewController(accountExist, animated: true)
        }
    }
    
    @objc private func privacyPolicyLabelTapped() {
        if let privacyPolicyVC = storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as? PrivacyPolicyViewController {
            privacyPolicyVC.modalPresentationStyle = .overCurrentContext
            privacyPolicyVC.modalTransitionStyle = .crossDissolve
            present(privacyPolicyVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func SignUpButtonTapped(_ sender: UIButton) {
        guard let name = YourNameTextField.text, !name.isEmpty,
              let email = YourEmailTextField.text, !email.isEmpty,
              let password = PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "All fields are required")
            return
        }
        
        let isSuccess = DatabaseManager.shared.insertUser(name: name, email: email, password: password)
        
        if isSuccess {
            if let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController {
                dashboardVC.modalPresentationStyle = .fullScreen
                present(dashboardVC, animated: true, completion: nil)
            } else {
                print("Cannot go inside dashboard")
            }
        } else {
            showAlert(message: "Failed to register user.")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
