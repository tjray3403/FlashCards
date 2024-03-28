//
//  ViewController.swift
//  tray_flashcardv2
//
//  Created by Tristan Earl Ray, Jr on 3/19/24.
//

import UIKit

    var questions: [String] = [] //make them to be global
    var answers: [String] = []
    var currentCardIndex: Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCardIndex = -1
        
        questions.append("Whats the capital of Japan")
        answers.append("Tokyo")
        questions.append("What is 2 to the power of 10?")
        answers.append("1024, which is 1k")
        questions.append("What is the capital of Vermont?")
        answers.append("Montpelier")
        questions.append("Which year was PVAMU established?")
        answers.append("1876")
    }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message:msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }


    @IBAction func nextCardBtn(_ sender: Any) {
        if questions.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "Please add more cards")
        } else {
            currentCardIndex += 1
            if currentCardIndex == questions.count {
                currentCardIndex = 0
            }
            questionLabel.text = questions[currentCardIndex]
            answerLabel.text = "?????"
        }
    }
    
    @IBAction func deleteCardBtn(_ sender: Any) {
        if questions.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "Please add more cards")
        } else {
            questions.remove(at: currentCardIndex)
            answers.remove(at: currentCardIndex)
            displayAlert(msgTitle: "Deleted Successfully", msgContent: "The card has been deleted")
            currentCardIndex = questions.count-1
            if questions.count >= 1 {
                questionLabel.text = questions[currentCardIndex]
                answerLabel.text = "?????"
            } else {
                questionLabel.text = "N/A"
                answerLabel.text = "N/A"
            }
                
        }
    }
    
    @IBAction func showAnswerBtn(_ sender: Any) {
        if questions.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "Please add more cards")
        } else if currentCardIndex < 0 {
            displayAlert(msgTitle: "Card Not selected", msgContent: "Please select a card by clicking the arrow key")
        } else {
            answerLabel.text = answers[currentCardIndex]
        }
    }
    
    @IBAction func addNewCardBtn(_ sender: Any) {//bring up the input view
        performSegue(withIdentifier: "go2InputView", sender: nil)
    }
    
}

