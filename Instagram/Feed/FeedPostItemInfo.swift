//
//  FeedPostItemInfo.swift
//  Instagram
//
//  Created by Rustam on 13.09.2023.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let userName: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOrLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}


