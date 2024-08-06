//
//  HorizontalCollectionViewTableViewCell.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import UIKit

class HorizontalCollectionViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var HeadingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var isSocialMediaRow = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let nib = UINib(nibName: "HorizontalCardCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HorizontalCardCell")
        let nib2 = UINib(nibName: "SocialMediaHorizontalCardCell", bundle: nil)
        collectionView.register(nib2, forCellWithReuseIdentifier: "SocialMediaHorizontalCardCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
    }
}

extension HorizontalCollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSocialMediaRow {
            return 3
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isSocialMediaRow {
            
            HeadingLabel.isHidden = false
            subHeadingLabel.isHidden = false
            collectionView.backgroundColor = .black
            contentView.backgroundColor = .black
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SocialMediaHorizontalCardCell", for: indexPath) as! SocialMediaHorizontalCardCell
            
            cell.photoImageView.image = UIImage(named: "DummyImage")
            if let customFontRegular = UIFont(name: "Strawford-Regular", size: 16) {
                let label1Text = "The Ultimate Guide To Simplifying Your Routine With Generative AI Automation!"
                
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont(name: "Strawford-Bold", size: 22) ?? UIFont.boldSystemFont(ofSize: 22)
                ]
                let regularAttributes: [NSAttributedString.Key: Any] = [
                    .font: customFontRegular
                ]
                HeadingLabel.attributedText = NSAttributedString(string: "Social Media", attributes: boldAttributes)
                subHeadingLabel.attributedText = NSAttributedString(string: "Stay update with my latest post on your favorite platforms", attributes: regularAttributes)
                cell.label1.attributedText = NSAttributedString(string: label1Text, attributes: regularAttributes)
            }else {
                
                cell.label1.text = "The Ultimate Guide To Simplifying Your Routine With Generative AI Automation!"
                HeadingLabel.text = "Social Media"
                subHeadingLabel.text = "Stay update with my latest post on your favorite platforms"
            }
            
            return cell
            
        } else {
            
            HeadingLabel.isHidden = true
            subHeadingLabel.isHidden = true
            collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            contentView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCardCell", for: indexPath) as! HorizontalCardCell
            cell.photoImageView.image = UIImage(named: "DummyImage")
            
            if let customFontRegular = UIFont(name: "Strawford-Regular", size: 16),
               let customFontSmall = UIFont(name: "Strawford-Regular", size: 13) {
                let label1Text = "  technology"
                let label3Text = "26 Feb 2024"
                
                let boldText = "Step Into Tomorrow"
                let regularText = ": Exploring Spatial Computing’s Impact On Industries And The Metaverse!"
                
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont(name: "Strawford-Bold", size: 17) ?? UIFont.boldSystemFont(ofSize: 17)
                ]
                
                let regularAttributes: [NSAttributedString.Key: Any] = [
                    .font: customFontRegular
                ]
                let smallAttributes: [NSAttributedString.Key: Any] = [
                    .font: customFontSmall
                ]
                
                cell.label1.attributedText = NSAttributedString(string: label1Text, attributes: smallAttributes)
                
                let boldAttributedString = NSAttributedString(string: boldText, attributes: boldAttributes)
                let regularAttributedString = NSAttributedString(string: regularText, attributes: regularAttributes)
                
                let combinedAttributedString = NSMutableAttributedString()
                combinedAttributedString.append(boldAttributedString)
                combinedAttributedString.append(regularAttributedString)
                
                cell.label2.attributedText = combinedAttributedString
                
                cell.label3.attributedText = NSAttributedString(string: label3Text, attributes: smallAttributes)
            } else {
                print("Custom font not found")
                cell.label1.text = "  technology"
                cell.label2.text = "Step Into Tomorrow: Exploring Spatial Computing’s Impact On Industries And The Metaverse!"
                cell.label3.text = "26 Feb 2024"
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isSocialMediaRow {
            return CGSize(width: 220, height: 440)
        }else {
            return CGSize(width: 280, height: 440)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    
}
