//
//  PostDetailView.swift
//  MyFirstViperApp
//
//  Created by sebastian on 9/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class PostDetailView: UIViewController {

    
    @IBOutlet var postDetailImage: UIImageView!
    @IBOutlet var postDetailTitle: UILabel!
    
    var presenter: PostDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PostDetailView: PostDetailViewProtocol {
    
    func showPostDetail(forPost post: PostModel) {
        postDetailTitle.text = post.title
        
        let url = URL(string: post.imageUrl)
        let placeHolderImage = UIImage(named: "placeholder")
        postDetailImage.af_setImage(withURL: url!, placeholderImage: placeHolderImage)
    }
}
