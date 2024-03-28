//
//  inputViewController.swift
//  tray_flashcardv2
//
//  Created by Tristan Earl Ray, Jr on 3/21/24.
//

import UIKit

class inputViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var qInput: UITextField!
    @IBOutlet weak var aInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qInput.delegate = self
        aInput.delegate = self
    }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message:msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func submitCardBtn(_ sender: Any) {
        qInput.resignFirstResponder() //Make the software keyboard to dissapear
        aInput.resignFirstResponder()
        
        //check wether the new card info is ready so that we can add the new card to the stack of the cards
        if qInput.text == "" || aInput.text == "" {//new card is not ready yet
            displayAlert(msgTitle: "Error", msgContent: "New card info is missing")
            return
        } else {
            //now it's ready to append this new card to the end of the stack of cards
            questions.append(qInput.text!)
            answers.append(aInput.text!)
            qInput.text = ""
            aInput.text = ""
            displayAlert(msgTitle: "Successful", msgContent: "The new card has been added.")
        }
    }
    
  

}
