//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Nkwenti Deshnic on 15/08/2020.
//  Copyright © 2020 Nkwenti Deshnic. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear the fields
        titleLabel.text = ""
        DateLabel.text = ""
        channelNameLabel.text = ""
        textView.text = ""
        
        // check if there is a video
        guard video != nil else {
            return
        }
        
        // create the embed url
        let dFormat = DateFormatter()
       dFormat.dateFormat = "EEEE, MM d, yyyy"
        DateLabel.text = dFormat.string(from: video!.published)
        
        let embedUrlString = Constance.YT_EMBED_URL + video!.videoId
        
        //load into the webview
        let url = URL(string: embedUrlString)
        
        let request = URLRequest(url: url!)
        webview.load(request)
        
        //set the title
        titleLabel.text = video!.title
        //set the date
        
        //set the channel name
        channelNameLabel.text = video!.channelTitle
//        set the description
        textView.text = video!.description
    }
    

    

}
