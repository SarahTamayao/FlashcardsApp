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
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20.0;
        frontLabel.layer.cornerRadius = 20.0;
        backLabel.layer.cornerRadius = 20.0;
        
        card.layer.shadowRadius = 15.0;
        card.layer.shadowOpacity = 0.2;
        
        choice1.layer.borderWidth = 3.0;
        choice1.layer.borderColor = #colorLiteral(red: 0.6636485457, green: 0.7353687882, blue: 1, alpha: 1);
        choice1.layer.cornerRadius = 15.0;
        
        choice2.layer.borderWidth = 3.0;
        choice2.layer.borderColor = #colorLiteral(red: 0.6636485457, green: 0.7353687882, blue: 1, alpha: 1);
        choice2.layer.cornerRadius = 15.0;
        
        choice3.layer.borderWidth = 3.0;
        choice3.layer.borderColor = #colorLiteral(red: 0.6636485457, green: 0.7353687882, blue: 1, alpha: 1);
        choice3.layer.cornerRadius = 15.0;
        
        choice4.layer.borderWidth = 3.0;
        choice4.layer.borderColor = #colorLiteral(red: 0.6636485457, green: 0.7353687882, blue: 1, alpha: 1);
        choice4.layer.cornerRadius = 15.0;
    }

    
    @IBAction func didTapFlashcard(_ sender: Any) {
        if (frontLabel.isHidden){
            frontLabel.isHidden = false;
        }else{
            frontLabel.isHidden = true;
        }
        
    }
    
    @IBAction func didTapChoice1(_ sender: Any) {
        choice1.isHidden = true;
    }
    
    @IBAction func didTapChoice3(_ sender: Any) {
        choice3.isHidden = true;
    }
    
    @IBAction func didTapChoice4(_ sender: Any) {
        choice4.isHidden = true;
    }
    
    @IBAction func didTapChoice2(_ sender: Any) {
        frontLabel.isHidden = true;
    }
    
}

