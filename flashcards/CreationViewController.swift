//
//  CreationViewController.swift
//  flashcards
//
//  Created by Andrew Yuan on 3/9/21.
//

import UIKit

class CreationViewController: UIViewController {

    
    var flashcardController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var extraAnswer1: UITextField!
    @IBOutlet weak var extraAnswer2: UITextField!
    @IBOutlet weak var extraAnswer3: UITextField!
    
    var initialQuestion: String?
    var initialAnswer: String?
    var extra1: String?
    var extra2: String?
    var extra3: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion;
        answerTextField.text = initialAnswer;
        // Do any additional setup after loading the view.
        extraAnswer1.text = extra1;
        extraAnswer2.text = extra2;
        extraAnswer3.text = extra3;
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true);
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        let questionText = questionTextField.text;
        let answerText = answerTextField.text;
        let extraAnswer1Text = extraAnswer1.text;
        let extraAnswer2Text = extraAnswer2.text;
        let extraAnswer3Text = extraAnswer3.text;
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty) {
            let alert = UIAlertController(title: "Empty field", message: "Enter something", preferredStyle: .alert);
            let okAction = UIAlertAction(title: "OK", style: .default);
            alert.addAction(okAction);
            present (alert, animated: true);
        }else{
            flashcardController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswer1: extraAnswer1Text!, extraAnswer2: extraAnswer2Text!, extraAnswer3: extraAnswer3Text!);
        dismiss (animated:true);
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
