//
//  LogoView.swift
//  Instagram
//
//  Created by Rustam on 13.09.2023.
//

import SnapKit
import UIKit

class LogoView: UIView {
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 104
        static let logoHeight: CGFloat = 130
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "InstagramLogo")
        return view
    }()
}

// MARK: - Private methods
private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHeight)
        }
    }
}
