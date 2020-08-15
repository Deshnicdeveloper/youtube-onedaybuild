//
//  Constance.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import Foundation

struct Constance {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUvG_RH3tAekGN5rPUVUmcIg"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constance.PLAYLIST_ID)&key=\(Constance.API_KEY)"
}
