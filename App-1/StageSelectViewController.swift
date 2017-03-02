//
//  StageSelectViewController.swift
//  App-1
//
//  Created by 高橋碧 on 2017/03/02.
//  Copyright © 2017年 高橋碧. All rights reserved.
//

import UIKit

class StageSelectViewController: UIViewController {

    // 送られてきたLevelを受け取る変数
    var receiveLevel = ""
    
    // Stageを送信するための変数
    var sendStage = ("","")
    
    // Levelのラベル宣言
    @IBOutlet weak var Level: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Level.text = receiveLevel
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // StageSelectに戻る処理
    @IBAction func backTop(seque: UIStoryboardSegue){
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
    
    // ボタン6の処理
    @IBAction func button6(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン7の処理
    @IBAction func button7(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン8の処理
    @IBAction func button8(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン9の処理
    @IBAction func button9(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン10の処理
    @IBAction func button10(_ sender: UIButton) {
        SelectSeque(sender)
    }

    // ボタン11の処理
    @IBAction func button11(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン12の処理
    @IBAction func button12(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン13の処理
    @IBAction func button13(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン14の処理
    @IBAction func button14(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン15の処理
    @IBAction func button15(_ sender: UIButton) {
        SelectSeque(sender)
    }

    // ボタン16の処理
    @IBAction func button16(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン17の処理
    @IBAction func button17(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン18の処理
    @IBAction func button18(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン19の処理
    @IBAction func button19(_ sender: UIButton) {
        SelectSeque(sender)
    }
    
    // ボタン20の処理
    @IBAction func button20(_ sender: UIButton) {
        SelectSeque(sender)
    }

    // GameへのSegueを指定するメソッド
    func SelectSeque(_ sender: UIButton){
        sendStage = (receiveLevel,sender.currentTitle! as String)
        performSegue(withIdentifier: "StageSelect-to-Game", sender: sendStage)
    }
    
    // Segue指定時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is (String,String) {
            let nextVC = segue.destination as! GameViewController
            nextVC.receiveStage = sender as! (String,String)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
