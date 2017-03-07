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
    
    // 銃弾名、速さ、割合を表す変数
    var bulletList: [(name: String, speed: CGFloat, percentage: Int)] = []
    
    // 銃弾の出現方向の頻度を表す変数
    var bulletDirection: [(direction: String,  percentage: Int)] = []
    
    // 銃弾出現の頻度を表す変数
    var frequency: [Double] = []
    
    @IBOutlet weak var Stage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Stage.text = receiveStage.0 + "-" + receiveStage.1
        // Do any additional setup after loading the view.
        
        // ステージによって出現させる銃弾の種類と方向の頻度を変更する
        if (Stage.text == "1-1") {
            bulletList.append(("black", 5, 100))
            bulletDirection.append(("left", 50))
            bulletDirection.append(("right", 50))
            frequency.append(2.0)
        } else if (Stage.text == "1-2") {
            bulletList.append(("black", 5, 80))
            bulletList.append(("red", 10, 20))
            bulletDirection.append(("left", 45))
            bulletDirection.append(("right", 45))
            bulletDirection.append(("up", 5))
            bulletDirection.append(("down", 5))
            frequency.append(2.0)
        } else if (Stage.text == "1-3") {
            bulletList.append(("black", 5, 50))
            bulletList.append(("red", 10, 50))
            bulletDirection.append(("left", 45))
            bulletDirection.append(("right", 45))
            bulletDirection.append(("up", 5))
            bulletDirection.append(("down", 5))
            frequency.append(2.0)
            frequency.append(13.0)
        } else if (Stage.text == "1-4") {
            bulletList.append(("black", 5, 50))
            bulletList.append(("red", 10, 30))
            bulletList.append(("blue", 15, 20))
            bulletDirection.append(("left", 50))
            bulletDirection.append(("right", 50))
            frequency.append(2.0)
        }
        
        for second in frequency {
            _ = Timer.scheduledTimer(timeInterval: second, target: self, selector: #selector(self.setBullet), userInfo: nil, repeats: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 出現させる銃弾の種類を決定するメソッド
    func setBullet() {
        // 1~100の整数１つをランダムに取得する
        var bulletNumber = (Int)(arc4random_uniform(100)) + 1
        var directionNumber = (Int)(arc4random_uniform(100)) + 1
        var bullet : (String, CGFloat, Int) = ("",0,0)
        var direction : String = ""
        
        // 出現させる銃弾の種類を決定する
        for_tmp:
            for tmp in bulletList {
                // 乱数値から銃弾の出現割合を順に引いていく
                bulletNumber -= tmp.percentage
                if (bulletNumber <= 0) {
                    bullet = tmp
                    break for_tmp
                }
        }
        
        // 出現させる銃弾の方向を決定する
        for_tmp2:
            for tmp in bulletDirection {
                // 乱数値から銃弾の出現割合を順に引いていく
                directionNumber -= tmp.percentage
                if (directionNumber <= 0) {
                    direction = tmp.direction
                    break for_tmp2
                }
        }
        
        // 銃弾画像のViewを作成する
        let name = bullet.0
        let speed = bullet.1
        
        // 画像を指定する
        let bulletImage = UIImage(named: name + ".png")
        
        // UIImageViewに画像を指定する
        let bulletImageView = UIImageView(image: bulletImage)
        
        // UIImageViewのサイズを指定する
        bulletImageView.bounds.size.width = 75
        bulletImageView.bounds.size.height = 25
        
        // 銃弾の出現する方向に応じて画像を回転させる
        // 並びに、決めた方向のうち、どこから来るのかを決める
        let angle: CGFloat
        if (direction == "up") {
            angle = CGFloat((270.0 * M_PI) / 180.0)
            bulletImageView.layer.position = CGPoint(x: CGFloat(arc4random_uniform(3)) * self.view.bounds.width * 0.22 + (self.view.bounds.width * 0.28) - 37.5, y: 0 - 75)
        } else if (direction == "down") {
            angle = CGFloat((90.0 * M_PI) / 180.0)
            bulletImageView.layer.position = CGPoint(x: CGFloat(arc4random_uniform(3)) * self.view.bounds.width * 0.22 + (self.view.bounds.width * 0.28) - 37.5, y: self.view.bounds.height)
        } else if (direction == "left") {
            angle = CGFloat((180.0 * M_PI) / 180.0)
            bulletImageView.layer.position = CGPoint(x: 0, y: CGFloat(arc4random_uniform(5)) * self.view.bounds.height * 0.12375 + (self.view.bounds.height * 0.211875) - 12.5)
        } else {
            // 何もしない
            angle = CGFloat((0.0 * M_PI) / 180.0)
            bulletImageView.layer.position = CGPoint(x: self.view.bounds.width, y: CGFloat(arc4random_uniform(5)) * self.view.bounds.height * 0.12375 + (self.view.bounds.height * 0.211875) - 12.5)
        }
        
        bulletImageView.transform = CGAffineTransform(rotationAngle: angle)
        
        // bulletImageView.image = bulletImage
        
        let tmp = (bulletImageView, speed)
        
        // Viewに追加する
        self.view.addSubview(bulletImageView)
        
        if (direction == "up") {
            _ = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.moveUp),  userInfo: tmp, repeats: true)
        } else if (direction == "down") {
            _ = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.moveDown),  userInfo: tmp, repeats: true)
        } else if (direction == "left") {
            _ = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.moveLeft),  userInfo: tmp, repeats: true)
        } else {
            _ = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.moveRight),  userInfo: tmp, repeats: true)
        }
    }
    
    // 移動メソッド(moveUp)
    func moveUp(timer: Timer) {
        let tmp = timer.userInfo as! (UIImageView, CGFloat)
        let bullet = tmp.0
        let speed = tmp.1
        
        bullet.center.y += speed
        
        let bulletHeight = self.view.bounds.height
        
        if (bullet.center.y > bulletHeight + (bullet.bounds.height / 2)) {
            timer.invalidate()
        }
        
    }
    
    // 移動メソッド(moveDown)
    func moveDown(timer: Timer) {
        let tmp = timer.userInfo as! (UIImageView, CGFloat)
        let bullet = tmp.0
        let speed = tmp.1
        
        bullet.center.y -= speed
        
        let bulletHeight = bullet.bounds.height
        
        if (bullet.center.y < 0 - bulletHeight) {
            timer.invalidate()
        }
        
    }
    
    // 移動メソッド(moveLeft)
    func moveLeft(timer: Timer) {
        let tmp = timer.userInfo as! (UIImageView, CGFloat)
        let bullet = tmp.0
        let speed = tmp.1
        
        bullet.center.x += speed
        
        let bulletWidth = self.view.bounds.width
        
        if (bullet.center.x > bulletWidth + (bullet.bounds.width / 2)) {
            timer.invalidate()
        }
        
    }
    
    // 移動メソッド(moveRight)
    func moveRight(timer: Timer) {
        let tmp = timer.userInfo as! (UIImageView, CGFloat)
        let bullet = tmp.0
        let speed = tmp.1
        
        bullet.center.x -= speed
        
        let bulletWidth = bullet.bounds.width
        
        if (bullet.center.x < 0 - bulletWidth) {
            timer.invalidate()
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

