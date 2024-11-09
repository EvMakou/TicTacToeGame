//
//  Coordinator.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

enum FullScreenCover: String, Identifiable {
    case start
    case game
    
    var id: String {
        rawValue
    }
}



final class Coordinator: ObservableObject {
    @ObservedObject private var startViewModel = StartSelectionViewModel()
    @Published var fullScreenCover: FullScreenCover?
    
    func present(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .start:
            StartView(viewModel: startViewModel)
        case .game:
            NavigationStack {
                GameView(gameViewModel: BoardViewModel(currentItem: startViewModel.selectedItem ?? .circle))
            }
        }
    }
}

