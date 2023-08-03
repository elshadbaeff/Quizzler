//
//  ViewController.swift
//  Quizzler
//
//  Created by Elshad Babaev on 03.08.2023.
//

import UIKit

class ViewController: UIViewController {

    var quizBrain = QuizBrain()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = UIColor(red: 255/255, green: 117/255, blue: 168/255, alpha: 1)
        progress.trackTintColor = .white
        progress.progressViewStyle = .bar
        progress.contentMode = .scaleToFill
        progress.semanticContentAttribute = .unspecified
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let falseButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitle("False", for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 206/255, blue: 209/255, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let trueButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitle("True", for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 206/255, blue: 209/255, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 37/255, green: 44/255, blue: 74/255, alpha: 1)
        updateUI()
        
        view.addSubview(questionLabel)
        view.addSubview(trueButton)
        view.addSubview(falseButton)
        view.addSubview(scoreLabel)
        view.addSubview(progressBar)
        
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.widthAnchor.constraint(equalToConstant: 350),
            
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            questionLabel.bottomAnchor.constraint(equalTo: trueButton.topAnchor, constant: -25),
            
            falseButton.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -25),
            falseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            falseButton.heightAnchor.constraint(equalToConstant: 100),
            falseButton.widthAnchor.constraint(equalToConstant: 350),
            
            trueButton.bottomAnchor.constraint(equalTo: falseButton.topAnchor, constant: -25),
            trueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trueButton.heightAnchor.constraint(equalToConstant: 100),
            trueButton.widthAnchor.constraint(equalToConstant: 350),
            
            
            
        
        
        
        
        ])
        
        
        
    }

    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}

