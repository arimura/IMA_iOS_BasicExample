//
//  ViewController.swift
//  BasicExample
//
//  Created by k-arimura on 2021/11/11.
//

import AVFoundation
import UIKit
import AVKit

class ViewController: UIViewController {
  static let ContentURLString = "https://voyagegroup.github.io/FluctSDK-Hosting/resources/kei.mp4"

  var playerViewController: AVPlayerViewController!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.black;
    setUpContentPlayer()
  }

  func setUpContentPlayer() {
    // Load AVPlayer with path to your content.
    let contentURL = URL(string: ViewController.ContentURLString)!
    let player = AVPlayer(url: contentURL)
    playerViewController = AVPlayerViewController()
    playerViewController.player = player

    showContentPlayer()
  }

  func showContentPlayer() {
    self.addChild(playerViewController)
    playerViewController.view.frame = self.view.bounds
    self.view.insertSubview(playerViewController.view, at: 0)
    playerViewController.didMove(toParent:self)
  }

  func hideContentPlayer() {
    // The whole controller needs to be detached so that it doesn't capture  events from the remote.
    playerViewController.willMove(toParent:nil)
    playerViewController.view.removeFromSuperview()
    playerViewController.removeFromParent()
  }
}
      

