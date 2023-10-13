//
//  ViewController.swift
//  Counter
//
//  Created by Антон Шишкин on 12.10.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var logTextView: UITextView!
        
    var counter = Counter()
    var logger = Logger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        counter.increment()
        logger.log(event: .increment)
        updateUI()
    }
    
    @IBAction func substractButtonPressed(_ sender: Any) {
        do {
            try counter.decrement()
            logger.log(event: .decrement)
        } catch {
            if let counterError = error as? Counter.CounterError {
                logger.log(event: .failed(description: counterError.description))
            }
        }
        updateUI()
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        counter.reset()
        logger.log(event: .reset)
        updateUI()
    }
    
    private func updateUI() {
        counterLabel.text = "\(counter.currentValue)"
        updateLogView()
        updateCounterLabel()
    }
    
    private func updateLogView() {
        logTextView.text = ""
        for item in logger.records {
            logTextView.text += "\n\(item)"
        }
        
        let range = NSRange(location: logTextView.text.count - 1, length: 0)
        logTextView.scrollRangeToVisible(range)
    }
    
    private func updateCounterLabel() {
        let value = counter.currentValue
        counterLabel.text = "Значение счётчика: \(value)"
    }
}
