//
//  ViewController.swift
//  SlideshowApp
//
//  Created by hirokawa rakuma on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fruitsImage: UIImageView!
    @IBOutlet weak var startstop: UIButton!
    @IBOutlet weak var `return`: UIButton!
    @IBOutlet weak var forward: UIButton!
    
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "apple.jpg")!,
        UIImage(named: "lemon.jpg")!,
        UIImage(named: "melon.jpg")!,
        UIImage(named: "strawberry.jpg")!,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fruitsImage.image = imageArray[nowIndex]
    }
    
    
    @IBAction func `return`(_ sender: Any) {
        nowIndex -= 1
        
        if (nowIndex == -1) {
            // indexを一番最初の数字に戻す
            nowIndex = imageArray.count-1
        }
        fruitsImage.image = imageArray[nowIndex]
    }
    
    @IBAction func forward(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        fruitsImage.image = imageArray[nowIndex]
        
    }
    
    
    @IBAction func startimage(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startstop.setTitle("停止", for: .normal)
            `return`.isEnabled = false
            forward.isEnabled = false
            `return`.alpha = 0.3;
            forward.alpha = 0.3;
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startstop.setTitle("再生", for: .normal)
            `return`.isEnabled = true
            forward.isEnabled = true
            `return`.alpha = 1.0;
            forward.alpha = 1.0;
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        fruitsImage.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // segueから遷移先のexpansionViewControllerを取得する
           let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
           // 遷移先のexpansionViewControllerで宣言しているx, yに値を代入して渡す
        expansionViewController.x = imageArray[nowIndex]
       }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    
    
    
}

