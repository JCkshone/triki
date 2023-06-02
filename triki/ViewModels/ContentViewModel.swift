//
//  ContentViewModel.swift
//  triki
//
//  Created by Juan Camilo Navarro on 2/06/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var gameBoard: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @Published var currentPlayer = "X"
    @Published var status: StatusGame = .startGame
    @Published var isFirstActive: Bool = true
    @Published var isSecondActive: Bool = false
    @Published var userWin: String = ""
}

extension ContentViewModel {
    func resetGame() {
        gameBoard = gameBoard.map { $0.map { _ in "" }}
        status = .startGame
        userWin = ""
        currentPlayer = "X"
    }
    
    func cellTapped(row: Int, col: Int) {
        if gameBoard[row][col] == "" {
            gameBoard[row][col] = currentPlayer
            withAnimation(.easeIn) {
                isFirstActive = currentPlayer == "O"
                isSecondActive = currentPlayer == "X"
            }
            currentPlayer = (currentPlayer == "X") ? "O" : "X"
        }
        validateHorizontal()
        validateVertical()
        validateDiagonal()
    }
    
    func validateFinishedGame() {
        let result = Dictionary(gameBoard.joined().map { ($0, 1) },
                                uniquingKeysWith: +)
        if result[""] == nil {
            status = .endGame
        }
    }
    
    func validateHorizontal() {
        guard case .startGame = status else {
            return
        }
        
        for item in gameBoard {
            let result = Dictionary(item.map { ($0, 1) },
                                    uniquingKeysWith: +)
            if result["X"] == 3 || result["O"] == 3 {
                withAnimation(.easeIn) {
                    status = .winGame
                    userWin = "Ganador Jugador \(result["X"] == 3 ? 1 : 2)"
                }
                return
            }
        }
        
        validateFinishedGame()
    }
    
    func validateDiagonal() {
        guard case .startGame = status else {
            return
        }
        var leftItems: [String] = []
        var rightItems: [String] = []
        for i in 0..<gameBoard.count {
            leftItems.append(gameBoard[i][i])
            rightItems.append(gameBoard[i][gameBoard.count-i-1])
        }
        validateResults(with: leftItems)
        validateResults(with: rightItems)
    }
    
    func validateVertical() {
        guard case .startGame = status else {
            return
        }
        
        var leftItems: [String] = []
        var middleItems: [String] = []
        var rightItems: [String] = []
        
        for i in 0..<gameBoard.count {
            leftItems.append(gameBoard[i][0])
            middleItems.append(gameBoard[i][1])
            rightItems.append(gameBoard[i][2])
        }
        validateResults(with: leftItems)
        validateResults(with: middleItems)
        validateResults(with: rightItems)
    }
    
    func validateResults(with items: [String]) {
        let itemsResult = Dictionary(items.map { ($0, 1) },
                                     uniquingKeysWith: +)
        if itemsResult["X"] == 3 || itemsResult["O"] == 3 {
            withAnimation(.easeIn) {
                status = .winGame
                userWin = "Ganador Jugador \(itemsResult["X"] == 3 ? 1 : 2)"
            }
            return
        }
        
        validateFinishedGame()
    }
}
