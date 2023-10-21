//
//  FeedViewController.swift
//  Instagram
//
//  Created by Rustam on 11.09.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    // MARK: Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "Rustam")!, username: "Rustam", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "DaryaAva")!, username: "Darya", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "KosmoSviatAva")!, username: "Sviat", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "NadyaAva")!, username: "Nadya", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Darya2Ava")!, username: "Darya", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "VikaAva")!, username: "Vika", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "AppleAva")!, username: "Apple", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "KarinaAva")!, username: "Karina", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "SanyaAva")!, username: "Sanya97", isAddButtonVisible: false, isNewStory: false)
        ]),
        .post(FeedPostItemInfo(userImage: UIImage(named: "DaryaAva")!, userName: "dasha_astapova", postSubtitle: "EI Calafate,Patagonia, Argentina", postImage: UIImage(named: "DaryaPost")!, numberOrLikes: 1000001, comment: CommentShortInfo(username: "dasha_astapova", commentText: "Сегодня я выпустила мой  любимый❤️ 2й поток 🥳"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "SanyaAva")!, userName: "Sanya97", postSubtitle: "Petropavlovsk", postImage: UIImage(named: "stepan_large")!, numberOrLikes: 114, comment: CommentShortInfo(username: "Sanya97", commentText: "Я сегодня вечером:D"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "AppleAva")!, userName: "Apple", postSubtitle: "New York", postImage: UIImage(named: "wwdc_2023")!, numberOrLikes: 94324, comment: CommentShortInfo(username: "Apple", commentText: "🍏WWDC23 was succcessful"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "Apple2post")!, userName: "AppleNew", postSubtitle: "Kanada", postImage: UIImage(named: "MacBook")!, numberOrLikes: 2498, comment: CommentShortInfo(username: "AppleNew", commentText: "New macbook 👨‍💻")))
    ]
}

// MARK: - Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell .self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil,
                                                 image: UIImage(systemName: "chevron.down"),
                                                 target: self,
                                                 action: nil,
                                                 menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(didTapPlusButton))
        
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc
    func didTapPlusButton() {
        print("1")
    }
    
    @objc
    func didTapDirectButton() {
        print("2")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки",
                                image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное",
                                image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

// MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
