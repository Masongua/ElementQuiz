//
//  ViewController.swift
//  ElementQuiz
//
//  Created by 5e on 1/18/23.
//

import UIKit


enum Mode {
    case flashCard
    case quiz
}

enum State {
    case question
    case answer
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    var mode: Mode = .flashCard {
        didSet {
                updateUI()
            }
    }
    
    var state: State = .question


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    var currentElementIndex = 0
    
    func updateFlashCardUI(elementName: String) {
        
            if state == .answer {
                answerLabel.text = elementName
            } else {
                answerLabel.text = "?"
            }
    }
    
    
    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        updateUI()
    }
    
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1

        if currentElementIndex >= elementList.count{
            currentElementIndex = 0
        }
        state = .question
        
        updateUI()
    }
    
    
    @IBOutlet weak var modeSelector: UISegmentedControl!
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    func updateQuizUI(elementName: String){
        switch state {
                case .question:
                    answerLabel.text = ""
                case .answer:
                    if answerIsCorrect {
                    answerLabel.text = "Correct!"
                    } else{
                    answerLabel.text = "❌"
                }
            }
    }
    
    
    func updateUI() {
        switch mode {
        case.flashCard:
        updateFlashCardUI(elementName: "elementName")
        case .quiz:
        updateQuizUI(elementName: "elementName")
            let elementName = elementList[currentElementIndex]
            let image = UIImage(named: elementName)
            imageView.image = image
        }
    }
    
    
    
    func textFieldShouldReturn(_textField: UITextField) -> Bool {
    let textFieldContents = textField.text!
    if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
    answerIsCorrect = true
    correctAnswerCount += 1
    }
    else {
    answerIsCorrect = false
     }
        if answerIsCorrect {
            print("Correct!")
        } else {
            print("❌")
        }
        
        state = .answer
        updateUI()
    return true
    }
    
    @IBAction func switchModes(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
                mode = .flashCard
            } else {
                mode = .quiz
            }
    }
    
}

