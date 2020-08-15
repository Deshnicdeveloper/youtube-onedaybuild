//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import Foundation

struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbNail = ""
    var published = Date()
    var channelTitle = ""
    
    
//    here we need to call the exact JSON keys from the API
    
    enum Codingkeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case videoId
        case title
        case thumbNail = "url"
        case published = "publishedAt"
        case description
        case channelTitle
    }
//    here we want to initialiaze the API
    init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: Codingkeys.self)
        let snippetContainer = try contianer.nestedContainer(keyedBy: Codingkeys.self, forKey: .snippet)
        
//        parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
//        parse channelTitle
        self.channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
//        parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
//        parse videoID
        let resourceIdcontainer = try snippetContainer.nestedContainer(keyedBy: Codingkeys.self, forKey: .resourceId)
        self.videoId = try resourceIdcontainer.decode(String.self, forKey: .videoId)
        
        
//        parse published date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
//        parse thumbNail
        let thumnailContainer = try snippetContainer.nestedContainer(keyedBy: Codingkeys.self, forKey: .thumbnails)
        let hightContainer = try thumnailContainer.nestedContainer(keyedBy: Codingkeys.self, forKey: .high)
        self.thumbNail = try hightContainer.decode(String.self, forKey: .thumbNail)
        
    }
    
    
    
}
