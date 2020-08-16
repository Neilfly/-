//
//  VedioBackground.swift
//  皮影之路
//
//  Created by 张雨飞 on 12/08/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit
import AVKit


class VedioBackground: AVPlayerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let player = AVPlayer(url: Bundle.main.url(forResource: "MenuVideo", withExtension: "mp4")!)
        player.play()
        player.preventsDisplaySleepDuringVideoPlayback = true
        loopVideo(videoPlayer: player)
        // Do any additional setup after loading the view.
        self.player = player
    }
    
    func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
