//
//  ViewController.swift
//  flashcards
//
//  Created by Andrew Yuan on 2/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func didTapFlashcard(_ sender: Any) {
        
        frontLabel.isHidden = true;
    }
    
}

