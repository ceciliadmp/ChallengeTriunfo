//
//  UpComingCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 13/07/22.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upComingCell"
    
    @IBOutlet var imagePoster: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, year: String, image: UIImage){
        imagePoster.image = image
        titleLabel.text = title
        dateLabel.text = year
        
        imagePoster.layer.cornerRadius =  self.frame.height / 24.0
        imagePoster.layer.masksToBounds = true
    }
    
}
