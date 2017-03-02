//
//  ViewController.swift
//  App-1
//
//  Created by 高橋碧 on 2017/03/01.
//  Copyright © 2017年 高橋碧. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    // Levelを送信するための変数
    var sendLevel:String = ""
    
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
    
    // ボタン1の処理
    @IBAction func button1(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン2の処理
    @IBAction func button2(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン3の処理
    @IBAction func button3(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン4の処理
    @IBAction func button4(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン5の処理
    @IBAction func button5(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // StageSelectへのSequeを指定するメソッド
    func SelectSeque(_ sender: UIButton){
        sendLevel = sender.currentTitle! as String
        performSegue(withIdentifier: "Top-to-StageSelect", sender: sendLevel)
    }
    
    // Seque指定時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is String {
            let nextVC = segue.destination as! StageSelectViewController
            nextVC.receiveLevel = sender as! String
        }
    }
}

