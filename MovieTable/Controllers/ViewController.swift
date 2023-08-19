//
//  ViewController.swift
//  MovieTable
//
//  Created by Kang on 2023/08/18.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 변수
    // 영화 데이터 받을 변수
    var moviesArray: [Movie] = []
    
    // 데이터 매니저
    let movieDataManager = MovieDataManager()
    
    // 테이블 뷰 선언
    private let tableView = UITableView()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpData()
        setUpTableView()
        setUpTableViewLayout()
        setUpNavigationBar()
    }
    // MARK: - Function
    // 데이터 관리 메서드
    func setUpData() {
        movieDataManager.setMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    func setUpNavigationBar() {
        title = "영화목록"
        
        // UIBarButtonItem 생성
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        // 네비게이션 바의 오른쪽에 버튼을 추가합니다.
        self.navigationItem.rightBarButtonItem = addButton
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc func addButtonTapped() {
        
        print("addButtonTapped")
        movieDataManager.addMovieData()
        moviesArray = movieDataManager.getMovieData()
        
        tableView.reloadData()
    }
    
    // 테이블 뷰 세팅
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀의 높이 설정
        tableView.rowHeight = 120
        
        // 셀의 레지스터
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    // 테이블 뷰 레이아웃 셋업 + addSubView
    func setUpTableViewLayout() {
        
        // 뷰에 테이블 뷰 추가
        view.addSubview(tableView)
        
        // 오토 레이아웃 세팅
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}


// MARK: - 확장
// 데이터 소스 확장
extension ViewController: UITableViewDataSource {
    
    // 몇개의 셀을 표시할지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    // 셀의 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 등록한 셀 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        // 셀에 데이터 넣기
        cell.movieImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.movieDescriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        return cell
    }
}

// 테이블 뷰 델리게이트 패턴 사용
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        
        // 데이터 전달
        detailVC.movieData = moviesArray[indexPath.row]
        
        // 화면 이동
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
