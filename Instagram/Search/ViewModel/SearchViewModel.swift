//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Rustam on 20.10.2023.
//

//import UIKit
//
//protocol SearchViewModelProtocol {
//    var reloadData: (() -> Void)? {  get set }
//    
//    var numberOfCells: Int { get }
//    
//    func getArticle(for row: Int) -> ArticleCellViewModel
//}
//
//final class SearchViewModel: SearchViewModelProtocol {
//    var reloadData: (() -> Void)?
//    
//    // MARK: - Properties
//    var numberOfCells: Int {
//        articles.count
//    }
//    
//    private var articles: [ArticleResponceObject] = [] {
//        didSet {
//            reloadData?()
//        }
//    }
//    
//    init() {
//        loadData()
//    }
//    
//    func getArticle(for row: Int) -> ArticleCellViewModel {
//        let article = articles[row]
//        return ArticleCellViewModel(article: article)
//    }
//    
//    
//    private func loadData() {
//        // TODO: loadData
//        
//        setupMockObjects()
//    }
//    
//    private func setupMockObjects() {
//        articles = [
//        ArticleResponceObject(title: "First object title", 
//                              description: "First object",
//                              urlToImage: "...",
//                              publishedAt: "23.23.23"),
//        ArticleResponceObject(title: "Second object title",
//                              description: "First object",
//                              urlToImage: "...",
//                              publishedAt: "23.23.23"),
//        ArticleResponceObject(title: "Third object title",
//                              description: "First object",
//                              urlToImage: "...",
//                              publishedAt: "23.23.23"),
//        ArticleResponceObject(title: "Fourth object title",
//                              description: "First object",
//                              urlToImage: "...",
//                              publishedAt: "23.23.23")]
//        
//    }
//}
