//
//  Menu.swift
//  皮影之路
//
//  Created by 张雨飞 on 12/08/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class MenuPage: UIViewController {
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.182669729, blue: 0.4321816862, alpha: 1)
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
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
