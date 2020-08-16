//
//  MainGameViewController.swift
//  皮影之路
//
//  Created by 张雨飞 on 13/08/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class MainGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        let alert = UIAlertController(title: "是否返回主页？", message: nil, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "是", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "否", style: .destructive, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
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
