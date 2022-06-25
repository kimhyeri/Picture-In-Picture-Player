//
//  PiPAVPlayerViewController.swift
//  PiPPlayerWithSwift
//
//  Created by 김혜리 on 2022/04/24.
//

import UIKit
import AVKit

final class PiPAVPlayerViewController: UIViewController {
    
    private var pipController: AVPictureInPictureController?
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUpPiPController()
    }
    
    private func settingUpPiPController() {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return
        }
        
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
extension PiPAVPlayerViewController: AVPictureInPictureControllerDelegate {
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
