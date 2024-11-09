//
//  BoardViewModel.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import Foundation

enum WinType {
    case horizontalTop
    case horizontalMiddle
    case horizontalBottom
    case verticalLeft
    case verticalMiddle
    case verticalRight
    case diagonalLeft
    case diagonalRight
}

class BoardViewModel: ObservableObject {
    private struct Constants {
        static let rightWinsCrossIndexPaths: [IndexPath] = [
            .init(row: 0, section: 2),
            .init(row: 1, section: 1),
            .init(row: 2, section: 0)
        ]
    }
    
    @Published private(set) var board: [IndexPath: ItemType] = [:]
    @Published private(set) var winType: WinType?
    
    @Published private(set) var currentItem: ItemType
    
    init(currentItem: ItemType) {
        self.currentItem = currentItem
    }
    
    func setItem(at indexPath: IndexPath) {
        guard board[indexPath] == nil else { return }
        
        board[indexPath] = currentItem
        
        if let winType = isWin(item: currentItem, indexPath: indexPath) {
            print("win! \(currentItem) type: \(winType)")
            self.winType = winType
        }
        
        if currentItem == .cross {
            currentItem = .circle
        } else {
            currentItem = .cross
        }
    }
    
    func setCurrentItem(_ item: ItemType) {
        currentItem = item
    }
    
    func restart() {
        board = [:]
        winType = nil
    }
    
    private func isWin(item: ItemType, indexPath: IndexPath) -> WinType? {
        let horizontalItems = board.filter({ $0.key.row == indexPath.row })
        let verticalItems = board.filter({ $0.key.section == indexPath.section })
        let leftDiagonalItems = board.filter({ $0.key.row == $0.key.section })
        let rightDiagonalItems = board.filter( { Constants.rightWinsCrossIndexPaths.contains($0.key) } )
        
        if checkLineWins(items: Array(horizontalItems.values), item: item) {
            if indexPath.row == 0 {
                return .horizontalTop
            } else if indexPath.row == 1 {
                return .horizontalMiddle
            } else {
                return .horizontalBottom
            }
        }
        
        if checkLineWins(items: Array(verticalItems.values), item: item) {
            if indexPath.section == 0 {
                return .verticalLeft
            } else if indexPath.section == 1 {
                return .verticalMiddle
            } else {
                return .verticalRight
            }
        }
        
        if checkLineWins(items: Array(leftDiagonalItems.values), item: item) {
            return .diagonalLeft
        }
        
        if checkLineWins(items: Array(rightDiagonalItems.values), item: item) {
            return .diagonalRight
        }
        
        return nil
    }
    
    private func checkLineWins(items: [ItemType], item: ItemType) -> Bool {
        guard items.count == 3 else { return false }
        return items.allSatisfy({ $0 == item })
    }
}

/*
 00 01 02
 10 11 12
 20 21 22
 */
