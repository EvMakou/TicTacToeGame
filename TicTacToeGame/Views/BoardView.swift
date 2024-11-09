//
//  BoardView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct BoardView: View {
    private struct Constants {
        static let borderSize: CGFloat = 20
        static let winLineColor: Color = .red
        static let rectangleColor: Color = .purple.opacity(0.1)
    }
    
    @ObservedObject var viewModel: BoardViewModel
    @State private var isWinAnimating: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 0, section: 0))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 0, section: 0)) {
                                view
                            }
                        })
                    Rectangle()
                        .fill(.white)
                        .frame(width: Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 0, section: 1))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 0, section: 1)) {
                                view
                            }
                        })
                    Rectangle()
                        .fill(.white)
                        .frame(width: Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                    
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 0, section: 2))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 0, section: 2)) {
                                view
                            }
                        })
                }
                .padding(.top, 10)
                Rectangle()
                    .fill(.white)
                    .frame(height: Constants.borderSize)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 1, section: 0))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 1, section: 0)) {
                                view
                            }
                        })
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 1, section: 1))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 1, section: 1)) {
                                view
                            }
                        })
                    Rectangle()
                        .fill(.white)
                        .frame(width: Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                    
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 1, section: 2))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 1, section: 2)) {
                                view
                            }
                        })
                }
                Rectangle()
                    .fill(.white)
                    .frame(height: Constants.borderSize)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 2, section: 0))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 2, section: 0)) {
                                view
                            }
                        })
                    Rectangle()
                        .fill(.white)
                        .frame(width: Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 2, section: 1))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 2, section: 1)) {
                                view
                            }
                        })
                    Rectangle()
                        .fill(.white)
                        .frame(width: Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                    
                    Rectangle()
                        .fill(Constants.rectangleColor)
                        .frame(width: geometry.size.width / 3 - Constants.borderSize, height: geometry.size.height / 3 - Constants.borderSize)
                        .onTapGesture {
                            viewModel.setItem(at: .init(row: 2, section: 2))
                        }
                        .overlay(content: {
                            if let view = getItem(by: .init(row: 2, section: 2)) {
                                view
                            }
                        })
                }
                
            }
            .padding(0)
            .overlay {
                if let winType = viewModel.winType {
                    winLine(winType: winType)
                        .onAppear() {
                            isWinAnimating = false
                            withAnimation {
                                isWinAnimating = true
                            }
                        }
                }
            }
        }
    }
    
    @ViewBuilder func getItem(by indexPath: IndexPath) -> (some View)? {
        if let item = viewModel.board[indexPath] {
            switch item {
            case .circle:
                CircleView(size: 20)
            case .cross:
                CrossView()
            }
        }
    }
    
    @ViewBuilder func winLine(winType: WinType) -> some View {
        GeometryReader { geometry in
            switch winType {
            case .horizontalTop:
                Rectangle()
                    .fill(Constants.winLineColor)
                    .frame(width: isWinAnimating ? geometry.size.width : 0, height: 10)
                    .padding(.top, (geometry.size.height / 3) / 2)
                    
            case .horizontalMiddle:
                Rectangle()
                    .fill(Constants.winLineColor)
                    .frame(width: isWinAnimating ? geometry.size.width : 0, height: 10)
                    .padding(.top, geometry.size.height / 2)
            case .horizontalBottom:
                Rectangle()
                    .fill(Constants.winLineColor)
                    .frame(width: isWinAnimating ? geometry.size.width : 0, height: 10)
                    .padding(.top, geometry.size.height - (geometry.size.height / 3) / 2)
            case .verticalLeft:
                Rectangle()
                    .fill(Constants.winLineColor)
                    .frame(width: 10, height: isWinAnimating ? geometry.size.height : 0)
                    .padding(.leading, (geometry.size.width / 3) / 2)
            case .verticalMiddle:
                Rectangle()
                    .fill(Constants.winLineColor)
                    .frame(width: 10, height: isWinAnimating ? geometry.size.height : 0)
                    .padding(.leading, (geometry.size.width / 2))
            case .verticalRight:
                Rectangle()
                    .fill(Constants.winLineColor)
                    .frame(width: 10, height: isWinAnimating ? geometry.size.height : 0)
                    .padding(.leading, geometry.size.width - (geometry.size.width / 3) / 2)
            case .diagonalLeft:
                ScreenDiagonalLine()
                    .trim(from: 0.0, to: isWinAnimating ? 1 : 0)
                    .stroke(Constants.winLineColor, lineWidth: 10)
                    .animation(.linear(duration: 2), value: isWinAnimating)
                    .rotationEffect(Angle(degrees: 270))
            case .diagonalRight:
                ScreenDiagonalLine()
                    .trim(from: 0.0, to: isWinAnimating ? 1 : 0)
                    .stroke(Constants.winLineColor, lineWidth: 10)
                    .animation(.linear(duration: 2), value: isWinAnimating)
            }
        }
    }
}

struct ScreenDiagonalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))

        return path
    }
}
