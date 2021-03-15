//
//  ViewController.swift
//  flashcards
//
//  Created by Andrew Yuan on 2/14/21.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
    var extra1: String
    var extra2: String
    var extra3: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var flashcards = [Flashcard]();
    var currentIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        readSavedCards()
        if flashcards.count == 0{
            updateFlashcard(question: "Who is the current POTUS??", answer: "Joe Biden", extraAnswer1: "Donald Trump", extraAnswer2: "The Rock", extraAnswer3: "George Washington", isExisting: false);
        } else{
            updateLabels();
            updateNextPrevButtons();
        }
        
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
    
    func readSavedCards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]{
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                return Flashcard(question:dictionary["question"]!, answer: dictionary["answer"]!, extra1: dictionary["extra1"]!, extra2: dictionary["extra2"]!, extra3: dictionary["extra3"]!);
            }
            flashcards.append(contentsOf: savedCards);
        }
    }
    
    func updateFlashcard(question: String, answer:String, extraAnswer1:String, extraAnswer2:String, extraAnswer3:String, isExisting: Bool )
    {
        let flashcard = Flashcard(question: question, answer: answer, extra1: extraAnswer1, extra2: extraAnswer2, extra3: extraAnswer3);
        
        if isExisting {
            flashcards[currentIndex] = flashcard;
            print("exists");
        } else {
        
            flashcards.append(flashcard);
            print("Added flashcard!!!");
            print("We now have \(flashcards.count) flashcards");
            currentIndex = flashcards.count - 1;
            print("Our current index is \(currentIndex)");
            
            
            
            
        }
        updateNextPrevButtons();
        
        updateLabels();
        saveAllFlashcardsToDisk();
    }
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false;
        } else {
            nextButton.isEnabled = true;
        }
        if currentIndex == 0 {
            prevButton.isEnabled = false;
        } else {
            prevButton.isEnabled = true;
        }
        
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex];
        frontLabel.text = currentFlashcard.question;
        backLabel.text = currentFlashcard.answer;
        choice1.setTitle(currentFlashcard.extra1, for: .normal);
        choice2.setTitle(currentFlashcard.answer, for: .normal);
        choice3.setTitle(currentFlashcard.extra2, for: .normal);
        choice4.setTitle(currentFlashcard.extra3, for: .normal);
    }
    
    func saveAllFlashcardsToDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String:String] in
            return ["question":card.question, "answer":card.answer, "extra1": card.extra1, "extra2": card.extra2, "extra3": card.extra3];
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards");
        print("saved cards!");
        
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
    @IBAction func didTapNext(_ sender: Any) {
        currentIndex = currentIndex + 1;
        updateLabels();
        updateNextPrevButtons();
    }
    
    @IBAction func didTapDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete flashcard?", message: "Are you sure?", preferredStyle: .actionSheet);
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.deleteCurrentFlashcard();
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel);
        alert.addAction(deleteAction);
        alert.addAction(cancelAction);
        present(alert, animated: true);
    }
    
    func deleteCurrentFlashcard(){
        
        if (flashcards.count == 1){
            let alert = UIAlertController(title: "Can't Delete", message: "Only one flashcard", preferredStyle: .alert);
            let okAction = UIAlertAction(title: "OK", style: .default);
            alert.addAction(okAction);
            present (alert, animated: true);
        }else{
            flashcards.remove(at: currentIndex);
            if (currentIndex > flashcards.count - 1){
                currentIndex = flashcards.count - 1;
            }
            updateLabels();
            updateNextPrevButtons();
            saveAllFlashcardsToDisk();
        }
        
    }
    @IBAction func didTapPrev(_ sender: Any) {
        currentIndex = currentIndex - 1;
        updateLabels();
        updateNextPrevButtons();
    }
}

