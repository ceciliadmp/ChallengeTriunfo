//
//  ViewController.swift
//  ChallengeTriunfo
//
//  Created by Cecília on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = []//Movie.popularMovies()
    var nowPlayingMovies: [Movie] = [] //Movie.nowPlayingMovies()
    var upComingMovies: [Movie] = [] //Movie.upcomingMovies()
    

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
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        
        
        
        
        Task {
            popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            
            nowPlayingMovies = await Movie.nowPlayingAPI()
            self.nowplayingCollectionView.reloadData()
            
            upComingMovies = await Movie.upComingAPI()
            self.upcomingCollectionView.reloadData()
        }
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor(named: "roxinhoLegal")?.cgColor, UIColor(named: "roxinhoChato")?.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}
