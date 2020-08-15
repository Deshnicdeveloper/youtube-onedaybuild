//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModalDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideo()
    }
      //MARK:- MODEL DELEGATE METHOds
    
    func videosFetched(_ videos: [Video]) {
        // set the return video our video property
        
        self.videos = videos
        
//        refresh the table view
        tableView.reloadData()
    }
    
    //MARK:- TABLE VIEW METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constance.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
//        configure the cell with the data
        // Get the title for the vidoe in question
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
//        Return cell
        return cell
    }


}

