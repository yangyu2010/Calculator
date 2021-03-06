//
//  ContentView.swift
//  Calculator
//
//  Created by YangYu on 2020/1/13.
//  Copyright © 2020 YangYu. All rights reserved.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size:76))
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad().padding(.bottom)
        }
        
    }
}

struct CalculatorButtonPad: View {
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
         .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
      ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { arr in
                CalculatorButtonRow(row: arr)
            }
        }
    }
    
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack(spacing: 8){
            ForEach(row, id:\.self) {item in
                CalculatorButton(
                    title: item.title,
                    titleColor: item.titleColor,
                    size: item.size,
                    backgroundColorName:
                    item.backgroundColorName) {
                        print("Button: \(item.title)")
                    }
//                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
//                    print("Button: \(item.title)")
//                }
            }
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let titleColor: String
    let fontSize: CGFloat = 38
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
//    var body: some View {
//        ZStack {
//            Circle()
//                .frame(width: size.width, height: size.height)
//                .foregroundColor(Color(backgroundColorName))
//            Text(title)
//                .font(.system(size: fontSize))
//                .foregroundColor(Color(titleColor))
//        }
//    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(Color(titleColor))
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width * 0.5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView().previewDevice("iPhone SE")
//        ContentView().previewDevice("iPad Air 2")
        
    }
}
