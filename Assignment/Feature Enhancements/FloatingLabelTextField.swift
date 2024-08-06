//
//  FloatingLabelTextField.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import UIKit

class FloatingLabelTextField: UITextField {
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero)
    var floatingLabelHeight: CGFloat = 14
    @IBInspectable
    var _placeholder: String?
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.gray {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.blue
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var floatingLabelBackgroundColor: UIColor = UIColor.white
    @IBInspectable
    var cornerRadius: CGFloat = 20 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable
    var textPadding: CGFloat = 25
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder 
        placeholder = self._placeholder
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.backgroundColor = floatingLabelBackgroundColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.addSubview(self.floatingLabel)
            
            NSLayoutConstraint.activate([
                self.floatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                self.floatingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
                self.floatingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.floatingLabel.heightAnchor.constraint(equalToConstant: self.floatingLabelHeight)
            ])
            
            self.placeholder = ""
            
            UIView.animate(withDuration: 0.25) {
                self.floatingLabel.alpha = 1.0
                self.floatingLabel.transform = CGAffineTransform(translationX: 0, y: -self.floatingLabelHeight)
            }
        }
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 0.25, animations: {
                self.floatingLabel.alpha = 0.0
                self.floatingLabel.transform = .identity
            }) { _ in
                self.floatingLabel.removeFromSuperview()
            }
            self.placeholder = self._placeholder
        }
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: textPadding, bottom: 0, right: textPadding + 20))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: textPadding, bottom: 0, right: textPadding + 20))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: textPadding, bottom: 0, right: textPadding + 20))
    }
}
