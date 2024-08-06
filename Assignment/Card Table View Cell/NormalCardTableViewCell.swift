//
//  NormalCardTableViewCell.swift
//  Assignment
//
//  Created by Sameer Jain on 06/08/24.
//

import Foundation

import UIKit

class NormalCardTableViewCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    private func setupUI() {
        print("Setting up UI")
        print("PhotoImageView bounds: \(self.photoImageView.bounds)")
        
        self.innerView.layer.cornerRadius = 20
        self.innerView.layer.masksToBounds = true
        
        photoImageView.image = UIImage(named: "DummyImage")
        
        if let customFontRegular = UIFont(name: "Strawford-Regular", size: 16),
           let customFontSmall = UIFont(name: "Strawford-Regular", size: 13) {
            let label1Text = "  technology"
            let label3Text = "26 Feb 2024"
            
            let boldText = "Step Into Tomorrow"
            let regularText = ": Exploring Spatial Computing’s Impact On Industries And The Metaverse!"

            let boldAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Strawford-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
            ]

            let regularAttributes: [NSAttributedString.Key: Any] = [
                .font: customFontRegular
            ]
            let smallAttributes: [NSAttributedString.Key: Any] = [
                .font: customFontSmall
            ]
            
            label1.attributedText = NSAttributedString(string: label1Text, attributes: smallAttributes)

            let boldAttributedString = NSAttributedString(string: boldText, attributes: boldAttributes)
            let regularAttributedString = NSAttributedString(string: regularText, attributes: regularAttributes)

            let combinedAttributedString = NSMutableAttributedString()
            combinedAttributedString.append(boldAttributedString)
            combinedAttributedString.append(regularAttributedString)

            label2.attributedText = combinedAttributedString
            
            label3.attributedText = NSAttributedString(string: label3Text, attributes: smallAttributes)
        } else {
            label1.text = "  technology"
            label2.text = "Step Into Tomorrow: Exploring Spatial Computing’s Impact On Industries And The Metaverse!"
            label3.text = "26 Feb 2024"
        }
        
        
    }
}
