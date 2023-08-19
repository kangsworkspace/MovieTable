//
//  DetailView.swift
//  MovieTable
//
//  Created by Kang on 2023/08/19.
//

import UIKit

final class DetailView: UIView {
    
    // MARK: - 변수 선언    
    // 영화 이미지
    var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // 영화 제목
    let movieNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 영화 설명
    let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    // 스택 뷰
    let stackView: UIStackView = {
       let st = UIStackView()
        st.axis = .vertical
        st.spacing = 15
        st.alignment = .fill
        st.distribution = .fill
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    
    // MARK: - viewDidLoad
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setStackView()
        setUpAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - 함수 선언
    func setStackView() {
        
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(movieImage)
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(movieDescriptionLabel)
    }
    
    // 오토 레이아웃 셋업
    func setUpAutoLayOut() {
        setStackViewAutoLayout()
        setMovieImageAutoLayout()
        setMovieNameAutoLayout()
        setMovieDescriptionAutoLayout()
    }
    
    // 스택 뷰 오토 레이아웃
    func setStackViewAutoLayout() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
    
    // 영화 이미지 오토 레이아웃
    func setMovieImageAutoLayout() {
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 240),
            movieImage.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    // 영화 이름 오토 레이아웃
    func setMovieNameAutoLayout() {
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
    }
    
    // 영화 설명 오토 레이아웃
    func setMovieDescriptionAutoLayout() {
        NSLayoutConstraint.activate([
            movieDescriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

