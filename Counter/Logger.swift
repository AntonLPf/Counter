//
//  Logger.swift
//  Counter
//
//  Created by Антон Шишкин on 13.10.23.
//

import Foundation

struct Logger {
    
    private(set) var records: [String] = ["История изменений:"]
    
    mutating func log(event: Event) {
        let recordString = getRecordString(from: event)
        addRecord(recordString)
    }
    
    private func getRecordString(from event: Event) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: date)
        
        var result = "[\(dateString)]: "
        
        switch event {
        case .increment:
            result += "значение изменено на +1"
        case .decrement:
            result += "значение изменено на -1"
        case .reset:
            result += "значение сброшено"
        case .failed(let description):
            result += description
        }
        return result
    }
    
    private mutating func addRecord(_ string: String) {
        guard !string.isEmpty else { return }
        
        records.append(string)
    }
    
    enum Event {
        case increment
        case decrement
        case reset
        case failed(description: String)
    }
    
}
