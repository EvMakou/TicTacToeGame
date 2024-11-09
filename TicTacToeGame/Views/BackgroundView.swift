//
//  BackgroundView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        let color1 = Color(red: 0.6235, green: 0.4196, blue: 0.8588)
        let color2 = Color(red: 0.5098, green: 0.3569, blue: 0.8157)
        let color3 = Color(red: 0.4235, green: 0.3020, blue: 0.7765)
        LinearGradient(gradient: Gradient(colors: [color1, color2, color3]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
