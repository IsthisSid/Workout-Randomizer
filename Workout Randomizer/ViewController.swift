//
//  ViewController.swift
//  Workout Randomizer
//
//  Created by Sidany Walker on 10/8/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var pumpTextLabel: UILabel!
    
    @IBAction func submitPressed(_ sender: UIButton) {
        //gets the text from the textField the user inputs
        
        let myText = textField.text
        //update previous text of textview
        textView.text = myText
    }
    
    //typing animation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pumpTextLabel.text = "" //this empty string empties our label
        var charIndex = 0.0 //note this is a double
        let pumpText = "🏋🏻‍♀️Pump it up!"
        for letter in pumpText {
            print("-")
            print(0.1 * charIndex)
            print(letter)
            //adding each letter after an incremental amount of time, repeating can be false or true
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in self.pumpTextLabel.text?.append(letter)
            }
            //error-use ? because the pumpTextLabel needs to be clearly marked as self, note that we are in a closure
            
            charIndex += 1
            // in order not to have the letters to start at the same time, we need a delay for every subsequent letter, so inside this for-loop, we +=1
            //0.3 * charIndex = delay of 0.3 seconds, 0.4 * charIndex = delay of 0.4 seconds, etc
            
        }
    }
}
