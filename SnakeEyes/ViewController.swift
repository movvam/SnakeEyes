/**
  ViewController.swift
  SnakeEyes

  Created by Manikanth Movva on 12/12/17.
  Copyright © 2017 Manikanth Movva. All rights reserved.
*/

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    // var links to left and right dice text fields
    @IBOutlet weak var LeftDice: UITextField!
    @IBOutlet weak var RightDice: UITextField!
    
    var messageLine: String = ""
    // messageLine is a String representing the message the user sees when rolling a snake eyes.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareAudio(filename: String){
        do{
            let audioPath = Bundle.main.path(forResource: filename, ofType: ".mp3")
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        }catch{
            print("error")
        }
    }

    func createAlert (title: String, message: String){
        // creates an animated alert
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func DiceRolled(_ sender: Any) {
        
        prepareAudio(filename: "diceRoll")
        player.play()
        
        let randIntLeft = arc4random_uniform(6) + 1
        let randIntRight = arc4random_uniform(6) + 1
        // randIntLeft and Right are random integers representing a number on a dice
        
        LeftDice.text = "\(randIntLeft)"
        RightDice.text = "\(randIntRight)"
        // sets text fields of the dice to the rolled random integers
        
        if randIntLeft == 1 && randIntRight == 1 {          // if snake eyes
            
            let randIntMessage = arc4random_uniform(2)
                    if randIntMessage == 1{
                        messageLine = "Bruh....."
                    } else{
                        messageLine = "Do it. You won't."
                    }           // Uses a random integer to select the message on the alert
                        
            createAlert(title: "SNAKE EYES", message: messageLine)
        }
        
    }
    

}

