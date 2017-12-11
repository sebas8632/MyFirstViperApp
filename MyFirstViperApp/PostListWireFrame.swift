//
//  PostListWireFrame.swift
//  MyFirstViperApp
//
//  Created by sebastian on 5/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class PostListWireFrame: PostListWireFrameProtocol{
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostListModule() -> UIViewController {
        
        let navController = storyboard.instantiateViewController(withIdentifier: "PostsNavigationController")
        
        if let view = navController.childViewControllers.first as? PostListView {
            let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
            let interactor: PostListInteractorInputProtocol & PostListRemoteDataManagerOutputProtocol = PostListInteractor()
            let remoteDataManager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
            let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
        
            return navController
        }
        
        return UIViewController()
        
    }

    /*
     Función que presenta la pantalla postDetail.
     */
    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel){
        
        let postDetailViewController = PostDetailWireFrame.createPostDetailModule(forPost: post)
        
        if let sourceView = view as? UIViewController {
            
            sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
    
}
