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
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    //            confrim that a video was selected
                guard tableView.indexPathForSelectedRow != nil else{
                    return
                }
                // get a reference from the video
                let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
    //            get a refernce to the detail viewcontroller
                let detailVC = segue.destination as! DetailViewController
                
                
    //            set the video property of the detail view ViewController
                detailVC.video = selectedVideo
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

