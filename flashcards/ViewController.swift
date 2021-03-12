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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController;
        let creationController = navigationController.topViewController as! CreationViewController;
        creationController.flashcardController = self;
        if (segue.identifier == "EditSegue"){
            creationController.initialQuestion = frontLabel.text;
            creationController.initialAnswer = backLabel.text;
            creationController.extra1 = choice1.currentTitle!;
            creationController.extra2 = choice3.currentTitle!;
            creationController.extra3 = choice4.currentTitle!;
        }
    }
    
    @IBAction func didTapFlashcard(_ sender: Any) {
        if (frontLabel.isHidden){
            frontLabel.isHidden = false;
        }else{
            frontLabel.isHidden = true;
        }
        
    }
    func updateFlashcard(question: String, answer:String, extraAnswer1:String, extraAnswer2:String, extraAnswer3:String)
    {
        frontLabel.text = question;
        backLabel.text = answer;
        
        choice1.setTitle(extraAnswer1, for: .normal);
        choice2.setTitle(answer, for: .normal);
        choice3.setTitle(extraAnswer2, for: .normal);
        choice4.setTitle(extraAnswer3, for: .normal);
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

