//
//  PostListPresenter.swift
//  MyFirstViperApp
//
//  Created by sebastian on 4/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class PostListPresenter: PostListPresenterProtocol {
    
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    
    /*
     Función que carga los post del interactor al presenter.
     */
    func viewDidLoad(){
        print("INICIO-PRESENTER")
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    /*
     Función que permite mostrar los detalles de un post en la view.
     */
    func showPostDetail(forPost post: PostModel){
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }
}


extension PostListPresenter: PostListInteractorOutputProtocol{
    
    /*
     Función que permite enviar los post desde el presenter a la view.
     */
    func didRetrievePosts(_ posts: [PostModel]){
    
        view?.hideLoading()
        view?.showPosts(with: posts)
    }
    
    /*
     Función que permite mostrar un error.
     */
    func onError(){
        
        view?.hideLoading()
        view?.showError()
    }
    
}
