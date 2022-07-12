//
//  NowPlayingCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
        
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.font = UIFont(name: "Cairo-Black", size: 16)
    }
    
}
