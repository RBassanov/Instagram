//
//  MainTabBarController.swift
//  Instagram
//
//  Created by Rustam on 24.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setupTabBar()
        
    }
//UINavigationController(rootViewController: FeedViewController())
    private func  generateTabBar() {
        viewControllers = [
            generateVC(viewController: FeedViewController(),
                       image: UIImage(systemName: "house.fill")),
            generateVC(viewController: SearchViewController(),  //viewModel: SearchViewModel()
                       image: UIImage(systemName: "magnifyingglass")),
            generateVC(viewController: AddViewController(),
                       image: UIImage(systemName: "plus.app")),
            generateVC(viewController: MusicViewController(),
                       image: UIImage(systemName: "music.note.list")),
            generateVC(viewController: ProfileViewController(),
                       image: UIImage(systemName: "person.circle"))
        ]
    }

    private func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.image = image
        
        return navigationController
        }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        tabBar.scrollEdgeAppearance = appearance
        
        view.tintColor = .black
    }
}
