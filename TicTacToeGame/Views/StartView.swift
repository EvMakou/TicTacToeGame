//
//  StartView.swift
//  TicTacToeGame
//
//  Created by Yauheni Chumakou on 9.11.24.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: StartSelectionViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    CircleView(size: 30)
                        .frame(width: 150, height: 150)
                        .padding(.trailing, 0)
                    
                    CrossView(size: 30)
                        .frame(width: 150, height: 150)
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    Text("Your selection: \(viewModel.selectedItem?.title ?? "")")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        viewModel.selectItem(.circle)
                    } label: {
                        Text("Play with ⚪️")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)

                    Button {
                        viewModel.selectItem(.cross)
                    } label: {
                        Text("Play with ❌")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(.purple)
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    Button {
                        coordinator.present(.game)
                    } label: {
                        Text("Next")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(viewModel.selectedItem == nil ? .gray : .white)
                    }
                    .disabled(viewModel.selectedItem == nil)
                    
                    Spacer()
                }
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    StartView(viewModel: StartSelectionViewModel())
}
