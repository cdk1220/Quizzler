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
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuestion = allQuestions.list[counter]
        questionLabel.text = currentQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(buttonPressed: sender.tag)
        
        if pickedAnswer == currentQuestion.answer {
            print("Got it right")
        }
        else {
            print("Got it wrong")
        }
        
        startOver()
        nextQuestion()
    }
    
    
    func updateUI() {
        
    }
    

    func nextQuestion() {
        currentQuestion = allQuestions.list[counter]
        questionLabel.text = currentQuestion.questionText
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
        if counter >= 12 {
            counter = 0
        }
        else {
            counter = counter + 1
        }
    }
    

    
}
