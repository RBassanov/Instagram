//
//  FeedStoriesCellInfo.swift
//  Instagram
//
//  Created by Rustam on 13.09.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
