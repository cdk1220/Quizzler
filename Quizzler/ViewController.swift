//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var currentQuestion : Question!
    var pickedAnswer : Bool = false
    var counter : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(buttonPressed: sender.tag)
        
        if pickedAnswer == currentQuestion.answer {
            ProgressHUD.showSuccess("Correct")
            score = score + 1
        }
        else {
            ProgressHUD.showError("Wrong")
        }
        
        nextQuestion()
        
    }
    
    
    func updateUI() {
        currentQuestion = allQuestions.list[counter]
        questionLabel.text = currentQuestion.questionText
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(counter + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(counter + 1)
        
    }
    

    func nextQuestion() {
        if counter >= 12 {
            let myAlert = UIAlertController(title: "Awesome", message: "Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            myAlert.addAction(restartAction)
            present(myAlert, animated: true, completion: nil)
        }
        else {
            counter = counter + 1
        }
        
        updateUI()
    }
    
    
    func checkAnswer(buttonPressed : Int) {
        if buttonPressed == 1 {
            pickedAnswer = true
        }
        else if buttonPressed == 2 {
            pickedAnswer = false
        }
    }
    
    
    func startOver() {
        counter = 0
        score = 0
        
        updateUI()
    }
    

    
}
