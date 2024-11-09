//
//  CoordinatorView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        coordinator.build(fullScreenCover: .start)
            .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                coordinator.build(fullScreenCover: fullScreenCover)
            }
            .environmentObject(coordinator)
    }
}
