//
//  PostListInteractor.swift
//  MyFirstViperApp
//
//  Created by sebastian on 4/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class PostListInteractor: PostListInteractorInputProtocol{
    
    weak var presenter: PostListInteractorOutputProtocol?
    // var localDatamanager: PostListLocalDataManagerInputProtocol?
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    

    /*
     Función que permite recuperar datos desde la API.
     */
    func retrievePostList(){
    
        do {
            remoteDatamanager?.retrievePostList()
        }
        catch {
            presenter?.didRetrievePosts([])
        }
    }
    
}


extension PostListInteractor: PostListRemoteDataManagerOutputProtocol{
    
    /*
     Función que envía los post desde el interactor hasta el presentador.
     */
    func onPostsRetrieved(_ posts: [PostModel]) {
        
        print("El tamaño es: \(posts)")
        
        presenter?.didRetrievePosts(posts)
        
    }
    
    func onError() {
        presenter?.onError()
    }
}
