//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Test on 15/03/22.
//

import UIKit

class ResultsViewController: UIViewController {

    //        MARK: - IB Outlets
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
//        MARK: - Public properties
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
        navigationItem.hidesBackButton = true
    }

    private func updateResult() {
        var frequecyOfAnimals: [AnimalType: Int] = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            frequecyOfAnimals[animal] = (frequecyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequncyAnimals = frequecyOfAnimals.sorted {$0.value > $1.value}
        guard let mostFrequenseAnimal = sortedFrequncyAnimals.first?.key else {return}
        
       updateUI(with: mostFrequenseAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDefinitionLabel.text = "\(animal.difinition)"
    }
}
