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
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    var secondsRemaining = 60
    
    var timer = Timer()

    @IBAction func hardnessSelectors(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 1.0
        
        if let hardness = sender.currentTitle {
            if let eggTime = eggTimes[hardness] {
                secondsRemaining = eggTime
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
            
        }
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}
