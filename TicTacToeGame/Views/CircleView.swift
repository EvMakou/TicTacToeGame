//
//  CircleView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct CircleView: View {
    var size: CGFloat = 40
    var strokeColor: Color = .white
    var fillColor: Color = .clear
    
    var body: some View {
        GeometryReader() { geometry in
            //Color.red
            Circle()
                .stroke(strokeColor, lineWidth: size)
                .fill(fillColor)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .padding(20)
    }
}

#Preview {
    CircleView()
}
