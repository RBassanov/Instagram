//
//  AddViewController.swift
//  Instagram
//
//  Created by Rustam on 24.09.2023.
//

import UIKit
import SnapKit

class AddViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "cat"))
        imageView.contentMode = .scaleAspectFill // Масштабируем изображение для заполнения всего экрана
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
