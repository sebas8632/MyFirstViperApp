//
//  PostListCell.swift
//  MyFirstViperApp
//
//  Created by sebastian on 3/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit
import AlamofireImage

class PostListCell: UITableViewCell {

    @IBOutlet var postImage: UIImageView!
    @IBOutlet var postName: UILabel!
    

    func set(forPost post: PostModel) {
        self.selectionStyle = .none
        postName?.text = post.title
        let url = URL(string: post.thumbImageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImage?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }

}
