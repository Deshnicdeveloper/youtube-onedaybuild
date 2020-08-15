//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import Foundation

class Model {
    
    func getVideo() {
        
//        create url objext
        
        let  url = URL(string: Constance.API_URL)
        
        guard url != nil else { return }
        
        
//        get url session object
        
        let session = URLSession.shared
        
        
//        get data task from the url session
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
//            check for error
            if error != nil || data == nil{
                return
            }
            
//            parsing the data intot the video objects
        }
        
        
//        kick off the task
        
        datatask.resume()
    }
}
