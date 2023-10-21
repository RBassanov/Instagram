//
//  SearchCollectionViewCell.swift
//  Instagram
//
//  Created by Rustam on 18.10.2023.
//

import UIKit
import SnapKit

final class SearchCollectionViewCell: UICollectionViewCell {
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "Apple2post") ?? UIImage.add
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.5
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    
    // MARK: - Private methods
    
    private func setupUI() {
        addSubview(imageView)
//        addSubview(blackView)
//        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        
//        blackView.snp.makeConstraints { make in
//            make.height.equalTo(50)
//            make.leading.trailing.bottom.equalToSuperview()
//        }
//        
//        titleLabel.snp.makeConstraints { make in
//            make.top.bottom.equalTo(blackView)
//            make.leading.trailing.equalTo(blackView).offset(5)
//        }
    }
}
