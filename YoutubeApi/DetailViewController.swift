//
//  DetailViewController.swift
//  YoutubeApi
//
//  Created by Yuan-Che Chang on 2020/9/8.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var change = 0
    var item:Items?
    @IBOutlet weak var ytPlayer: YTPlayerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var showDetail: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = item?.snippet.title
        detailLabel.text = item?.snippet.description
        let videoId = (item?.snippet.resourceId.videoId) ?? ""
        getVideo(videoCode: videoId)
        
    }
    
    func getVideo(videoCode:String) {
          ytPlayer.load(withVideoId: videoCode)
      }
    
    //呈現詳細資訊的收合
    @IBAction func showDetailButton(_ sender: Any) {
        if change == 0 {
            change = 1
            detailLabel.numberOfLines = 0
            showDetail.setTitle("Show less information", for: .normal)
        }else{
            change = 0
            detailLabel.numberOfLines = 5
            showDetail.setTitle("Show full information", for: .normal)
        }
    }
    
   

}
