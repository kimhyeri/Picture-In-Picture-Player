//
//  ViewController.swift
//  PiPPlayerWithSwift
//
//  Created by 김혜리 on 2022/04/03.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var pipController: AVPictureInPictureController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingUpPiPController()
    }
    
    func settingUpPiPController() {
        guard let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }
        
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()

        if AVPictureInPictureController.isPictureInPictureSupported() {
            pipController = AVPictureInPictureController(playerLayer: playerLayer)
            pipController?.delegate = self
            pipController?.canStartPictureInPictureAutomaticallyFromInline = true
        } else {
            print("not supported")
        }
    }
}

// MARK: - AVPictureInPictureControllerDelegate
extension ViewController: AVPictureInPictureControllerDelegate {
    func pictureInPictureControllerWillStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerWillStartPictureInPicture")
    }

    func pictureInPictureControllerDidStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerDidStartPictureInPicture")
    }

    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, failedToStartPictureInPictureWithError error: Error) {
        print("failedToStartPictureInPictureWithError")
    }

    func pictureInPictureControllerWillStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerWillStopPictureInPicture")
    }

    func pictureInPictureControllerDidStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerDidStopPictureInPicture")
    }

    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        print("restoreUserInterfaceForPictureInPictureStopWithCompletionHandler")
    }
}
