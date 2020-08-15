//
//  Constance.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import Foundation

struct Constance {
    static var API_Key = "AIzaSyDueyu-6aQowNaylWU6ZXD3vSd1RL0TDwk"
    static var PLAYLIST_ID = "UUZH6G3Z5XINU6r92QN1l5Lw"
    static var API_URL = "  https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constance.PLAYLIST_ID)&key=\(Constance.API_Key)"
}
