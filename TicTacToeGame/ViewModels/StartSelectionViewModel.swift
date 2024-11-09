//
//  StartSelectionViewModel.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import Foundation

enum ItemType {
    case circle
    case cross
    
    var title: String {
        switch self {
        case .circle:
            "⚪️"
        case .cross:
            "❌"
        }
    }
}

class StartSelectionViewModel: ObservableObject {
    @Published private(set) var selectedItem: ItemType?
    
    func selectItem(_ item: ItemType) {
        selectedItem = item
    }
}
