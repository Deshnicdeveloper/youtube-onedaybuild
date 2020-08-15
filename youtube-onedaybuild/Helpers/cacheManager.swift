//
//  cacheManager.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import Foundation


class cacheManager {
    static var cacheFile = [String:Data]()
    static func setVideoCache(_ url:String, _ data:Data?){
//        store the url image data and use the url as the key
        cacheFile[url] = data
    }
    static func getVideoCache(_ url:String) -> Data? {
        // try to get the data for the specify url
        return cacheFile[url]
    }
}
