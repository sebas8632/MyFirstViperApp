//
//  PostDetailPresenter.swift
//  MyFirstViperApp
//
//  Created by sebastian on 10/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    weak var view: PostDetailViewProtocol?
    var wireFrame : PostDetailWireFrameProtocol?
    var post: PostModel?
    
    
    //View -> Presenter
    
    /*
     Función que permite indicar a la vista que muestre los detalles de una vista.
     */
    func viewDidLoad() {
        view?.showPostDetail(forPost: post!)
    }
    
}
