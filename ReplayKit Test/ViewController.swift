//
//  ViewController.swift
//  ReplayKit Test
//
//  Created by Tim Ericson on 9/11/21.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {
    
    let recorder = RPScreenRecorder.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func recordTapped(_ sender: Any) {
        
        recorder.startRecording { (error) in
            if let error = error {
                print(error)
            }
        }
    }
    
    
    @IBAction func stopTapped(_ sender: Any) {
        recorder.stopRecording { previewVC, error in
            if let previewVC = previewVC {
                previewVC.previewControllerDelegate = self
                self.present(previewVC, animated: true, completion: nil)
            }
            
            if let error = error {
                print(error)
            }
        }
    }
    
}

extension ViewController: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        dismiss(animated: true, completion: nil)
    }
}

