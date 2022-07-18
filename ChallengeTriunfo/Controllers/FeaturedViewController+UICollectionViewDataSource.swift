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
        
        let movie = popularMovies[indexPath.item]
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: image)
            
        }
        
        cell?.setup(title: movie.title, image: UIImage())

        return cell ?? PopularCollectionViewCell()
    }
    
    
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowplayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let movie = nowPlayingMovies[indexPath.item]
        let year: String = String(movie.releaseDate.prefix(4))
        
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            
            cell?.setup(title: movie.title, year: year, image: image)
            
        }
        
        cell?.setup(title: movie.title,
                    year: year,
                    image: UIImage(named: movie.posterPath) ??
                    UIImage())
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    
    
    fileprivate func upComingCell(_ indexPath: IndexPath) -> UpComingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpComingCollectionViewCell.cellIdentifier, for: indexPath) as? UpComingCollectionViewCell
        
        let movie = upComingMovies[indexPath.item]
        let year: String = String(upComingMovies[indexPath.item].releaseDate.prefix(4))
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            
            cell?.setup(title: movie.title, year: year, image: image)
            
        }
        
        cell?.setup(title: movie.title,
                    year: year,
                    image: UIImage(named: movie.posterPath) ??
                    UIImage())
        
        
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
