//
//  MainGame.swift
//  皮影之路
//
//  Created by 张雨飞 on 13/08/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit
import AVKit

class MainGame: AVPlayerViewController {
    
    var soundPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player = AVPlayer(url: Bundle.main.url(forResource: "shanghainew", withExtension: "mp4")!)
        player.play()
        player.preventsDisplaySleepDuringVideoPlayback = true
        
        self.player = player
        // Do any additional setup after loading the view.
        
        let url = Bundle.main.url(forResource: "Audiomachine_Promised_Land", withExtension: "mp3")
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url!)
            soundPlayer.play()
            soundPlayer.numberOfLoops = -1
        }
            
        catch {
            print(error)
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
