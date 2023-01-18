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

class ViewController: UIViewController {
    
    
    var mode: Mode = .flashCard


    override func viewDidLoad() {
        super.viewDidLoad()
        updateElement()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    var currentElementIndex = 0
    
    func updateElement() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image; answerLabel.text = "?"
    }
    
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = elementList[currentElementIndex]
    }
    
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex > 3{
            currentElementIndex = 0
            updateElement()
        }
        
        updateElement()
    }
    
    
}

