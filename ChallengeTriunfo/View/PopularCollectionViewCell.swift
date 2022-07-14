//
//  PopularCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
        imageView.layer.cornerRadius =  self.frame.height / 16.0
        imageView.layer.masksToBounds = true
        
        self.backgroundColor = UIColor.clear
           
        }
        
    }
    
    
    
    
    

