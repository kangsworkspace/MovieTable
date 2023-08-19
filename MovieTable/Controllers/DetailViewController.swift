//
//  DetailViewController.swift
//  MovieTable
//
//  Created by Kang on 2023/08/19.
//

import UIKit

class DetailViewController: UIViewController {

    // MVC 패턴 적용
    private let detailView = DetailView()

    // 영화 데이터 받을 변수
    var movieData: Movie?
    
    // DetailView 불러오기
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    func setData() {
        detailView.movieImage.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.movieDescriptionLabel.text = movieData?.movieDescription
    }
}
