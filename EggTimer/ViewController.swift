//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelectors(_ sender: UIButton) {
        
        timer.invalidate()
        
        
        if let hardness = sender.currentTitle {
            if let eggTime = eggTimes[hardness] {
                totalTime = eggTime
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
            
        }
    }
    
    @objc func updateTimer() {
        if totalTime > secondsPassed {
            let percentageProgress = secondsPassed / totalTime
            progressBar.progress = percentageProgress
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}
