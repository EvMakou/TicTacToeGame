//
//  ContentView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var gameViewModel: BoardViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack(spacing: 30) {
                    Text("You")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Text("0 - 0")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.white)
                        .foregroundStyle(.purple)
                        .cornerRadius(10)
                    
                    Text("AI")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 40)
                
                BoardView(viewModel: gameViewModel)
                    .frame(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width - 10)
                
                Button {
                    gameViewModel.restart()
                } label: {
                    Text("Restart")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.white)
                        .padding(20)
                        .frame(width: UIScreen.main.bounds.width - 90)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                            .stroke(.white, lineWidth: 2)
                        )
                }
                .padding(.top, 30)
                
                Button {
                    dismiss()
                } label: {
                    Text("End Game")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.purple)
                        .padding(20)
                        .frame(width: UIScreen.main.bounds.width - 90)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                            .fill(.white)
                        )
                }
                .padding(.top, 10)
            }
            
        }
    }
}

#Preview {
    GameView(gameViewModel: .init(currentItem: .circle))
}
