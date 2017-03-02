//
//  GameViewController.swift
//  App-1
//
//  Created by 高橋碧 on 2017/03/02.
//  Copyright © 2017年 高橋碧. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // 送られてきたStageを受け取る変数
    var receiveStage = ("","")
    
    @IBOutlet weak var Stage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Stage.text = receiveStage.0 + "-" + receiveStage.1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
