//
//  ViewController.swift
//  AirProducer
//
//  Created by Kitan Ogunfeibo on 28/05/2017.
//  Copyright © 2017 Kosine. All rights reserved.
//

import UIKit
import AVKit
import Firebase
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad(
        
        
        self.setupView()
        
        
        
        )
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setupView() {
    
        let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "IntroMov", ofType: "mp4")!)
        
        let player = AVPlayer(url: path as URL)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.airProdTextCenter(containerView: self.videoView)
        player.play()
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil, using: { (_) in
            DispatchQueue.main.async {
                player.seek(to: kCMTimeZero)
                player.play()
            }
        })
    
    }
    
    func airProdTextCenter(containerView: UIView){
    
    
        let half:CGFloat = 1.0 / 2.0
        
        let airProdLabel = UILabel()
        
        airProdLabel.text = "AIR PROD"
        airProdLabel.font = UIFont(name: "ArialRoundedMTBold", size: 40)
        airProdLabel.backgroundColor = UIColor.clear
        airProdLabel.textColor = UIColor.white
        airProdLabel.sizeToFit()
        airProdLabel.textAlignment = NSTextAlignment.center
        airProdLabel.frame.origin.x = (containerView.frame.size.width - airProdLabel.frame.size.width) * half
        airProdLabel.frame.origin.y = (containerView.frame.size.height - airProdLabel.frame.size.height) * half
        containerView.addSubview(airProdLabel)
        
    }
}

