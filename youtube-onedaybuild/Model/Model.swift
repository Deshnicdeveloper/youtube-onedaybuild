//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import Foundation

protocol ModalDelegate {
    func videosFetched(_ videos:[Video]) 
    
}

class Model {
    
    var delegate :ModalDelegate?
    
    
    func getVideo() {
        
//        create url objext
        
        let  url = URL(string: Constance.API_URL)
        
        guard url != nil else { return }
        
        
//        get url session object
        
        let session = URLSession.shared
        
        
//        get data task from the url session
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
//            check for error
            if error != nil || data == nil{
                return
            }
            do{
                
//                 parsing the data intot the video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil {
                    DispatchQueue.main.async {
                        
                        // call the "videoReturned methosd of the deleagte
                        
                            self.delegate?.videosFetched(response.items!)
                    }
            }
//                 dump(response)
            }
            catch{
                
            }
        }
        
        
//        kick off the task
        
        dataTask.resume()
    }
}
