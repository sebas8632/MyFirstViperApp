//
//  PostListRemoteDataManager.swift
//  MyFirstViperApp
//
//  Created by sebastian on 5/12/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostListRemoteDataManager: PostListRemoteDataManagerInputProtocol{
    
    
    
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    /*
     Función que permite obtener todos los post desde la API.
     */
    func retrievePostList(){
        
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get)
            .validate()
            .responseArray { (response: DataResponse<[PostModel]>) in
                
                switch response.result {
                    
                    case .success(let posts):
                        //Se envian los post desde el datamanager hasta el presentador.
                        self.remoteRequestHandler?.onPostsRetrieved(posts)
                    
                    case .failure(_):
                        self.remoteRequestHandler?.onError()
    
                }
        }
    }
    
}
