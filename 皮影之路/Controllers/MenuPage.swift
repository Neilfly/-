//
//  Menu.swift
//  皮影之路
//
//  Created by 张雨飞 on 12/08/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit
import AVFoundation

class MenuPage: UIViewController {
    
    var sPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playMusic()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        playMusic()
    }
    
    @IBAction func turnAndPause(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainGameViewController") as! MainGameViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            self.sPlayer.pause()
        }
    }
    
    func playMusic() {
        let url = Bundle.main.url(forResource: "Alton_Wang_New_Hope", withExtension: "mp3")
        do {
            sPlayer = try AVAudioPlayer(contentsOf: url!)
            sPlayer.play()
            sPlayer.numberOfLoops = -1
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
