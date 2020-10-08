//
//  ViewController.swift
//  Workout Randomizer
//
//  Created by Sidany Walker on 10/8/20.
//

import UIKit

class ViewController: UIViewController {
     

    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var workoutImageView: UIImageView!
    
    @IBAction func timeButtonPressed(_ sender: UIButton) {
        let timeArray = [#imageLiteral(resourceName: "fiveMinButton"),#imageLiteral(resourceName: "tenMinButton"),#imageLiteral(resourceName: "fifteenMinButton"),#imageLiteral(resourceName: "twentyMinButton")]
        
        timeImageView.image = timeArray[Int.random(in: 0...3)]

    }
    
    @IBAction func workoutButtonPressed(_ sender: UIButton) {
        
        let workoutArray = [#imageLiteral(resourceName: "weightsButton"),#imageLiteral(resourceName: "squatsButton"),#imageLiteral(resourceName: "jogButton"),#imageLiteral(resourceName: "plankButton")]
        
        workoutImageView.image = workoutArray[Int.random(in: 0...3)]
    }
}
    
