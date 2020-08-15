//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideo()
    }


}

