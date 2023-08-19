//
//  ViewController.swift
//  MovieTable
//
//  Created by Kang on 2023/08/18.
//

import UIKit

class ViewController: UIViewController {

    // Movie 데이터를 받을 변수
    var moviesArray: [Movie] = []
    
    // 테이블 뷰 선언
    private let tableView = UITableView()
    
    // 데이터 매니저 사용
    var movieDataManager = MovieDataManager()
    

// =====================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        setUpTableView()
        setUpNavigationBar()
        setUpData()
        setTableViewAutoLayout()

    }
// =====================================================================
    

    
    // 네이게이션 바 UI 설정
    func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // 테이블 뷰 셋업
    func setUpTableView() {
        // 델리게이트 패턴, 데이터 처리 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 120
    }
    
    // 데이터 셋업
    func setUpData() {
        movieDataManager.setMovieData()
        moviesArray = movieDataManager.getMovieDataArray()
    }
    
    
    // 테이블 뷰 오토 레이아웃
    func setTableViewAutoLayout() {
        
        // 뷰에 테이블 뷰 추가
        view.addSubview(tableView)
        
        // 오토 레이아웃 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    

}
// =====================================================================

// 데이터 소스
extension ViewController: UITableViewDataSource {
    
    // 셀의 숫자
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    // 셀의 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.movieDescriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

// 델리게이트 패턴 사용
extension ViewController: UITableViewDelegate {
    
    // 셀이 선택되었을 때 처리
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        // 다음 화면으로 이동
        let detailVC = DetailViewController()
        detailVC.movieData = moviesArray[indexPath.row]
        
        // show
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
