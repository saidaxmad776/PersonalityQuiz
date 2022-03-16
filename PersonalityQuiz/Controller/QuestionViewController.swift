//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Test on 15/03/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //        MARK: IB Outlets

   
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!

    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabel: [UILabel]!
    @IBOutlet var multipleSwitch: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangeSlider: UISlider!
    
    @IBOutlet weak var questionProgres: UIProgressView!
    //        MARK: private Properties
    
    private let question = Question.getQuestion()
    private var questionIndex = 0
    private var answersChoesen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    //        MARK: - IB Action
    
    @IBAction func singleAnswersButton(_ sender: UIButton) {
        let currentAnswers = question[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoesen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButton() {
        let currentAnswer = question[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitch, currentAnswer) {
            if multipleSwitch.isOn {
                answersChoesen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswersButton() {
        let currentAnswers = question[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        answersChoesen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    

    //        MARK: - Private Methods
    
    // Update user interfase
    private func updateUI() {
        // Hide evereting
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = question[questionIndex]
        
        // Set current question for question label
        questionLabel.text = currentQuestion.text
        
            // Set progres for question progres view
        let totalProgres = Float(questionIndex / question.count)
        
        questionProgres.setProgress(totalProgres, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(question.count)"
        
        let currentAnswers = currentQuestion.answers
        
        // Show stack view corresponding to question type
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    
    
    /// Setup single stack view
    /// - Parameter answers: - array  with answers
    ///
    private func updateSingleStackView(using answers: [Answer]) {
        // Show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    /// Setup multiple stack view
    /// - Parameter answer: - array with answer
    private func updateMultipleStackView(using answer: [Answer]) {
        // Show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabel, answer) {
            label.text = answer.text
        }
    }
    
    /// Setup ranged stack view
    /// - Parameter answer: - array with answer
    private func updateRangedStackView(using answer: [Answer]) {
        // Show multiple stack view
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answer.first?.text
        rangedLabels.last?.text = answer.last?.text
        }
    
    // MARK: - Navigation
    // Show next question or go to the next screen

    private func nextQuestion() {
        // TODO: Implement the function
        questionIndex += 1
        
        if questionIndex < question.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoesen
    }

}

