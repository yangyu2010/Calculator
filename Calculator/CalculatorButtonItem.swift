//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by YangYu on 2020/1/13.
//  Copyright © 2020 YangYu. All rights reserved.
//

import UIKit

enum CalculatorButtonItem {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
    
}


extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var titleColor: String {
        switch self {
        case .command:
            return "commandTitleColor"
        default:
            return "normalTitleColor"
        }
    }
    
    var size: CGSize {
        switch self {
        case .digit(let num):
            return ((num == 0) ? CGSize(width: 88 * 2 + 8, height: 88) : CGSize(width: 88, height: 88))
        default:
            return CGSize(width: 88, height: 88)
        }
        
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digitBackground"
        case .op:
            return "operatorBackground"
        case .command:
            return "commandBackground"
        }
    }
}

extension CalculatorButtonItem: Hashable {}
