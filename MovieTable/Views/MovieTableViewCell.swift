//
//  MovieTableViewCell.swift
//  MovieTable
//
//  Created by Kang on 2023/08/19.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {
    
    // MARK: - 변수 선언
    // 영화 이미지
    let movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // 영화 제목 레이블
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    // 영화 설명 레이블
    let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 영화 제목 + 영화 내용 스택 뷰
    let stackViewNamePlusDescription: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 8
        st.axis = .vertical
        st.distribution = .fill
        st.alignment = .fill
        return st
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        // 스택 뷰 세팅
        setUpStackView()
        
        // 레이아웃 세팅
        setUpAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - 함수
    // 스택 뷰 셋업
    func setUpStackView() {
        self.contentView.addSubview(movieImageView)
        self.contentView.addSubview(stackViewNamePlusDescription)
        
        stackViewNamePlusDescription.addArrangedSubview(movieNameLabel)
        stackViewNamePlusDescription.addArrangedSubview(movieDescriptionLabel)
    }
    
    // 오토 레이아웃 셋업
    func setUpAutoLayOut() {
        setMovieImageLayOut()
        setMovieNameLabelLayOut()
        setStackViewNamePlusDescriptionLayOur()
    }
    
    
    // MARK: - 레이아웃 세팅
    // 1.영화 이미지 레이아웃 세팅
    func setMovieImageLayOut() {
        
        NSLayoutConstraint.activate([
            movieImageView.heightAnchor.constraint(equalToConstant: 100),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            movieImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0)
        ])
    }
    
    // 2.영화 제목 레이아웃 세팅
    func setMovieNameLabelLayOut() {
        
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    // 3.영화 제목 + 영화 내용 스택 뷰 레이아웃 세팅
    func setStackViewNamePlusDescriptionLayOur() {
        
        NSLayoutConstraint.activate([
            stackViewNamePlusDescription.topAnchor.constraint(equalTo: self.movieImageView.topAnchor, constant: 0),
            stackViewNamePlusDescription.bottomAnchor.constraint(equalTo: self.movieImageView.bottomAnchor, constant: 0),
            stackViewNamePlusDescription.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 15),
            stackViewNamePlusDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0)
        ])
    }
}
