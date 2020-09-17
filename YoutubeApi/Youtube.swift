//
//  youtube.swift
//  YoutubeApi
//
//  Created by Yuan-Che Chang on 2020/9/6.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import Foundation
import UIKit

struct Youtube: Codable {
    
    var nextPageToken: String
    var items : [Items]
    
}

struct Items: Codable {
    
    var id: String
    var snippet: Snippet
    var contentDetails: ContentDetails
}


struct Snippet: Codable {
    var publishedAt :String
    var channelId : String
    var title : String
    var description : String
    var thumbnails : Thumbnails
    var channelTitle : String
    var resourceId:ResourceId

}

struct Thumbnails: Codable {
    var `default` : Default
    
    
}
struct ContentDetails: Codable {
    var videoId :String
    
}

struct Default: Codable {
    var url :String
    
    
}

struct ResourceId:Codable {
    var videoId:String
}



