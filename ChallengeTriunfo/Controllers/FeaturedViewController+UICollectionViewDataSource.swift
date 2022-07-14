//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        } else if collectionView == self.nowplayingCollectionView {
            return nowPlayingMovies.count
        }   else if collectionView == self.upcomingCollectionView {
            return upComingMovies.count
        }   else {
            return 0
        }
        
    }
        
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.setup(title: popularMovies[indexPath.item].title, image: UIImage(named: popularMovies[indexPath.item].backdrop) ?? UIImage())
        
        //cell?.titleLabel.text = popularMovies[indexPath.item].title
       //cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowplayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let year: String = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
        
        cell?.setup(title: nowPlayingMovies[indexPath.item].title,
                    year: year,
                    image: UIImage(named: nowPlayingMovies[indexPath.item].poster) ??
                    UIImage())
        
        //cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        //cell?.dateLabel.text = year
        //cell?.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func upComingCell(_ indexPath: IndexPath) -> UpComingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpComingCollectionViewCell.cellIdentifier, for: indexPath) as? UpComingCollectionViewCell
        
        let year: String = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
        
        cell?.setup(title: upComingMovies[indexPath.item].title,
                    year: year,
                    image: UIImage(named: upComingMovies[indexPath.item].poster) ??
                    UIImage())
        
        //cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        //cell?.dateLabel.text = year
        //cell?.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? UpComingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.popularCollectionView {
            
            return makePopularCell(indexPath)
                                   
        } else if collectionView == self.nowplayingCollectionView {
            
                return makeNowPlayingCell(indexPath)
                
            } else if collectionView == self.upcomingCollectionView {
                
                return upComingCell(indexPath)
                
        } else {
            return UICollectionViewCell()
        }
    }
}
