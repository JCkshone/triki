//
//  ContentView.swift
//  triki
//
//  Created by Juan Camilo Navarro on 25/05/23.
//

import SwiftUI

enum StatusGame {
    case endGame
    case winGame
    case tieGame
    case startGame
    
    var bgColor: Color {
        switch self {
        case .endGame:
            return .red
        case .winGame:
            return .green
        case .tieGame:
            return .yellow
        case .startGame:
            return .clear
        }
    }
    
    var copie: String {
        switch self {
        case .winGame: return ""
        case .startGame: return "Inicia la partida"
        default: return "Reiniciar"
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        ZStack {
            TrikiColor.background.swiftUIColor.ignoresSafeArea()
            VStack {
                HStack {
                    UserActionView(
                        isActive: $viewModel.isFirstActive,
                        description: "Jugador 1 - X"
                    )
                    
                    UserActionView(
                        isActive: $viewModel.isSecondActive,
                        description: "Jugador 2 - O"
                    )
                }
                .padding(.top)
                
                Button(viewModel.status.copie) {
                    if viewModel.status != .startGame {
                        withAnimation(.easeIn) {
                            viewModel.resetGame()
                        }
                    }
                }
                .foregroundColor(with: TrikiColor.text)
                .font(
                    .custom(
                        FontDefinition.regular.font,
                        size: 24
                    )
                )
                .padding(.all)

                Spacer()
                
                if viewModel.userWin.isEmpty {
                    VStack {
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<3) { col in
                                    Button {
                                        viewModel.cellTapped(row: row, col: col)
                                    } label: {
                                        Image(viewModel.gameBoard[row][col])
                                            .resizable()
                                            .frame(width: 58, height: 58)
                                    }
                                    .padding(.all)
                                    .background(with: TrikiColor.background)
                                }
                            }
                        }
                    }
                    .background(with: TrikiColor.text)
                } else {
                    Button {
                        withAnimation(.easeIn) {
                            viewModel.resetGame()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 50))
                                .foregroundColor(with: TrikiColor.text)
                            Text(viewModel.userWin)
                                .foregroundColor(with: TrikiColor.text)
                                .fontWeight(.bold)
                                .fontDesign(.monospaced)
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.all)
                        .background(TrikiColor.buttonContainer.swiftUIColor.opacity(0.6))
                        .cornerRadius(6)
                        .padding(.all)
                    }
                }
                
                Spacer()
                
                HStack {
                    Image(with: TrikiAsset.footers)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}

struct UserActionView: View {
    @Binding var isActive: Bool
    var description: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(description)
                .foregroundColor(with: TrikiColor.text)
                .font(
                    .custom(
                        FontDefinition.medium.font,
                        size: 16
                    )
                )
            
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(isActive ? TrikiColor.buttomContainerActive.swiftUIColor : TrikiColor.buttonContainer.swiftUIColor)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        
        
    }
}
