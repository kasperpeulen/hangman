//
//  ViewController.swift
//  hangman
//
//  Created by Kasper Peulen on 11/30/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var revealLabel: UILabel!
    @IBOutlet weak var lettersPicked: UILabel!
    
    @IBOutlet weak var connectGallow: UIView!
    @IBOutlet weak var leftGallow: UIView!
    @IBOutlet weak var bottomGallow: UIView!
    @IBOutlet weak var topGallow: UIView!
    
    @IBOutlet weak var input: UITextField!
    
    let model = Gameplay.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        revealLabel.text = model.revealString
        lettersPicked.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inputGiven(sender: UITextField) {
        model.addLetter(sender.text!)
        sender.text = ""
        revealLabel.text = model.revealString
        lettersPicked.text = model.lettersPicked.joinWithSeparator(" ")
        
        switch model.misses {
        case 1:
            bottomGallow.hidden = false
        case 2:
            leftGallow.hidden = false
        case 3:
            topGallow.hidden = false
        case 4:
            connectGallow.hidden = false
        default:
            1;
        }
    }
}
