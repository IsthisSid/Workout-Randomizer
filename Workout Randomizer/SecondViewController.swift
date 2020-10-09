//
//  SecondViewController.swift
//  Workout Randomizer
//
//  Created by Sidany Walker on 10/9/20.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var seconds = 300
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
//very important, if receiving errors related to outlets, check connection inspector in main.storyboard
    @IBOutlet weak var workoutImageView: UIImageView!
    @IBOutlet weak var timeSelectionLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timeSelectionLabel.text = String(seconds)
        //the seconds will be what the sender slides it to, and it will display in the text as a string
    }
        
    @IBAction func start(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.counter), userInfo: nil, repeats: true)
        //every second it calls the counter objc function
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        //allows the button to stay appearing on screen
    }
    
    @objc func counter() {
        seconds -= 1
        timeSelectionLabel.text = String(seconds)
        //counts down by 1 and displays that in the text
        
        if (seconds == 0) {
            timer.invalidate()
            
            //if down to 0, then the timer will be removed
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
            
            //when down to 0, the audio plays here:
            audioPlayer.play()
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        
        timer.invalidate()
        seconds = 300
        sliderOutlet.setValue(300, animated: true)
        timeSelectionLabel.text = "300"
        //resetting the time back to 300 seconds here
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
        //set the storyboard showing all the buttons again
        
        audioPlayer.stop()
    }
    

    @IBAction func selectWorkoutPressed(_ sender: UIButton) {
        let workoutArray = [#imageLiteral(resourceName: "squatsButton"),#imageLiteral(resourceName: "jogButton"),#imageLiteral(resourceName: "plankButton"),#imageLiteral(resourceName: "yogaButton"),#imageLiteral(resourceName: "weightsButton"),#imageLiteral(resourceName: "absButton"),#imageLiteral(resourceName: "moreAbsbutton")]
        
        workoutImageView.image = workoutArray[Int.random(in: 0...6)]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //we have to use do/catch because we want it to try it and if it fails, catch the error and we don't have a crash
        do
        {
            let audioPath = Bundle.main.path(forResource: "airhorn", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            //error
        }
        }
    }

