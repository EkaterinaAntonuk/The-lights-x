//
//  ViewController.swift
//  The lights x
//
//  Created by Ekaterina Kuznetsova on 11.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var lightColor = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonPressed() {
        switch lightColor {
                case 1:
                    view.backgroundColor = .red
                case 2:
                    view.backgroundColor = .yellow
                case 3:
                    view.backgroundColor = .purple
                case 4:
                    view.backgroundColor = .blue
                default:
                    view.backgroundColor = .red
                    lightColor = 0
                }
                lightColor += 1
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { print("Torch isn't available"); return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            if on { try device.setTorchModeOn(level: AVCaptureDevice.maxAvailableTorchLevel.significand) }
            device.unlockForConfiguration()
        } catch {
            print("Torch can't be used")
        }
    }
    
}

