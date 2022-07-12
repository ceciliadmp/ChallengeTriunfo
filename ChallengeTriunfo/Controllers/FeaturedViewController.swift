//
//  ViewController.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upComingMovies = Movie.upcomingMovies()

    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowplayingCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowplayingCollectionView.dataSource = self
        nowplayingCollectionView.delegate = self
        
    }
    

}
