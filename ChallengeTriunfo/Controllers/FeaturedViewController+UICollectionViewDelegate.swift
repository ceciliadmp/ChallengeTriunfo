//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if collectionView == popularCollectionView {    
            movie = popularMovies[indexPath.item]
        } else if
            collectionView == nowplayingCollectionView {
            movie = nowPlayingMovies[indexPath.item]
        } else {
            //collectionView == upcomingCollectionView
            movie = upComingMovies[indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
    
}


