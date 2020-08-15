//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleView: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video : Video?
    
    @IBOutlet weak var chanellnameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
//        ensure that we have a video
        
        guard self.video != nil else {
            return
        }
        
//        set the title, date and channel label
        
        self.titleView.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        self.chanellnameLabel.text = video?.channelTitle
        
//        set the thumbnail
        
        guard self.video!.thumbNail != ""  else {
            return
        }
//        check cache before downloading data
        if let cachedData = cacheManager.getVideoCache(self.video!.thumbNail) {
            // set the thumbnail imageview
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
//        download the thumbnail data
        let url = URL(string: self.video!.thumbNail)
//        get the shared url
        let session = URLSession.shared
//        create a dataTask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                //save the data in the cache
                cacheManager.setVideoCache(url!.absoluteString, data)
//            check that dowload url matches the video thumbnaial
            if url!.absoluteString != self.video?.thumbNail {
                // video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                return
            }
            
            // create the image object
            
            let image = UIImage(data: data!)
            
            
            // set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            
            }
        }
        // start data task
        dataTask.resume()
        
        
    }

}

