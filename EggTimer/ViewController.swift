//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    var timer = Timer()
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelectors(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        if let hardness = sender.currentTitle {
            titleLabel.text = hardness
            if let eggTime = eggTimes[hardness] {
                totalTime = eggTime
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
            
        }
    }
    
    @objc func updateTimer() {
        if totalTime > secondsPassed {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            playCompletedSound()
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
    func playCompletedSound() {
        
        player.play()
    }
    
    override func viewDidLoad() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
    }
}
