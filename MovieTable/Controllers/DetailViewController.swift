//
//  DetailViewController.swift
//  MovieTable
//
//  Created by Kang on 2023/08/18.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var movieData: Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }

    private func setUpUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }
}
