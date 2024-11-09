//
//  CrossView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct CrossView: View {
    var size: CGFloat = 20
    
    var body: some View {
        GeometryReader() { geometry in
            ZStack {
                Color.clear
                Rectangle()
                    .fill(.white)
                    .frame(width: geometry.size.width, height: size)
                    .rotationEffect(Angle(degrees: 45))
                
                Rectangle()
                    .fill(.white)
                    .frame(width: geometry.size.width, height: size)
                    .rotationEffect(Angle(degrees: -45))
            }
        }
    }
}

#Preview {
    CrossView()
}
