//
//  ViewController.swift
//  App-1
//
//  Created by 高橋碧 on 2017/03/01.
//  Copyright © 2017年 高橋碧. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Topに戻る処理
    @IBAction func backTop(seque: UIStoryboardSegue){
        
    }
    
    // チュートリアルボタンの処理
    @IBAction func TutorialButton(_ sender: UIButton) {
        performSegue(withIdentifier: "Top-to-Tutorial", sender: nil)
    }
    
    // 設定ボタンの処理
    @IBAction func ConfigButton(_ sender: UIButton) {
        performSegue(withIdentifier: "Top-to-Config", sender: nil)
    }
}

