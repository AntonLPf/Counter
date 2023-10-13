//
//  Counter.swift
//  Counter
//
//  Created by Антон Шишкин on 13.10.23.
//

import Foundation

struct Counter {
    
    private(set) var currentValue = 0
    
    mutating func increment() {
        currentValue += 1
    }
    
    mutating func decrement() throws {
        guard currentValue > 0 else {
            throw CounterError.attemptToDecrementZeroValue
        }
        currentValue -= 1
    }
    
    mutating func reset() {
        currentValue = 0
    }
    
    enum CounterError: Error {
        case attemptToDecrementZeroValue
        
        var description: String {
            switch self {
            case .attemptToDecrementZeroValue:
                return "попытка уменьшить значение счётчика ниже 0"
            }
        }
    }
}
