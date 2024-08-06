//
//  SignInViewController.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var YouremailTextField: FloatingLabelTextField!
    
    @IBOutlet weak var PasswordTextField: FloatingLabelTextField!
    
    @IBOutlet weak var DontHaveAnAccountLabel: UILabel!
    
    
    
    private let showPasswordButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPasswordField()
        setupDontHaveAnAccountLabel()
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
    
    func setupDontHaveAnAccountLabel() {
        DontHaveAnAccountLabel.isUserInteractionEnabled = true
        let tapDontHaveAnAccountLabel = UITapGestureRecognizer(target: self, action: #selector(dontHaveAnAccountLabelTapped))
        DontHaveAnAccountLabel.addGestureRecognizer(tapDontHaveAnAccountLabel)
    }
    
    @objc private func togglePasswordVisibility() {
        PasswordTextField.isSecureTextEntry.toggle()
        showPasswordButton.isSelected.toggle()
    }
    
    @objc private func dontHaveAnAccountLabelTapped() {
        if let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            navigationController?.popViewController(animated: true)
            navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
    
    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        guard let email = YouremailTextField.text, !email.isEmpty,
              let password = PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "All fields are required")
            return
        }
        
        let isSuccess = DatabaseManager.shared.fetchUser(email: email, password: password)
        if isSuccess {
            print("User Logged in successfully")
            if let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController {
                dashboardVC.modalPresentationStyle = .fullScreen
                present(dashboardVC, animated: true, completion: nil)
            }
        } else {
            showAlert(message: "Either Email or Password is wrong")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
