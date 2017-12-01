//
//  PostModel.swift
//  MyFirstViperApp
//
//  Created by sebastian on 30/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostModel {
    
    var id = 0
    var title = ""
    var imageUrl = ""
    var thumbImageUrl = ""
    
}


extension PostModel: Mappable {
    
    init?(map:Map) {
        
    }
    
    mutating func mapping(map: Map){
        id  <- map["id"]
        title   <- map["title"]
        imageUrl    <- map["imageUrl"]
        thumbImageUrl   <- map["thumbImageUrl"]
        
    }
}
