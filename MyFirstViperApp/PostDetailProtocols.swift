//
//  PostDetailProtocols.swift
//  MyFirstViperApp
//
//  Created by sebastian on 9/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

protocol PostDetailViewProtocol : class {
    
    var presenter: PostDetailPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
    func showPostDetail(forPost post: PostModel)
}

protocol PostDetailWireFrameProtocol : class{
    
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController
}

protocol PostDetailPresenterProtocol : class {
    
    var wireFrame : PostListWireFrameProtocol? {get set}
    var view: PostListViewProtocol? {get set}
    var post: PostModel {get set}
    
    //View -> Presenter
    func viewDidLoad()
    
}
