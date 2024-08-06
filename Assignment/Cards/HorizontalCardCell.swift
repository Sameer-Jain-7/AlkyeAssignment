//
//  HorizontalCardCell.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import UIKit

@IBDesignable
class HorizontalCardCell: UICollectionViewCell {
    
    
    
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
        
        self.contentView.layer.cornerRadius = 50
        self.contentView.layer.masksToBounds = true
        
        self.innerView.layer.cornerRadius = 20
        self.innerView.layer.masksToBounds = true
    }
}
