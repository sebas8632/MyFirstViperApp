//
//  PostDetailWireFrame.swift
//  MyFirstViperApp
//
//  Created by sebastian on 10/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class PostDetailWireFrame : PostDetailWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PostDetailController")
        
        if let view = viewController as? PostDetailView {
            
            let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
            let wireFrame: PostDetailWireFrameProtocol = PostDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.post = post
            presenter.wireFrame = wireFrame
            
            return viewController
            
        }
        
        return UIViewController()
        
    }

}
