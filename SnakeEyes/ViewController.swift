//
//  ViewController.swift
//  SnakeEyes
//
//  Created by Manikanth Movva on 12/12/17.
//  Copyright © 2017 Manikanth Movva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var LeftDice: UITextField!
    
    @IBOutlet weak var RightDice: UITextField!
    
    var messageLine: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createAlert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func DiceRolled(_ sender: Any) {
        
        let randIntLeft = arc4random_uniform(6) + 1
        let randIntRight = arc4random_uniform(6) + 1
        
        LeftDice.text = "\(randIntLeft)"
        RightDice.text = "\(randIntRight)"
        
        if randIntLeft == 1 && randIntRight == 1 {
            
            let randIntMessage = arc4random_uniform(2) 
                    if randIntMessage == 1{
                        messageLine = "Bruh....."
                    } else{
                        messageLine = "Do it. You won't."
                    }
            
            print("SNAKE EYES")
            
            createAlert(title: "SNAKE EYES", message: messageLine)
        }
        
    }
    

}

