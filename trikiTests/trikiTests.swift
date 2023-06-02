//
//  trikiTests.swift
//  trikiTests
//
//  Created by Juan Camilo Navarro on 25/05/23.
//

import XCTest
@testable import triki

final class trikiTests: XCTestCase {
    
    func test_resetGame() {
        let viewModel = getViewModel()
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "O", "O"],
            ["X", "O", "O"]
        ]
        viewModel.resetGame()
        XCTAssertEqual(viewModel.status, .startGame)
    }
    
    func test_winDiagonalRight() {
        let viewModel = getViewModel()
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "X", "O"],
            ["X", "O", "O"]
        ]
        viewModel.validateDiagonal()
        XCTAssertEqual(viewModel.status, .winGame)
    }
    
    func test_winDiagonalLef() {
        let viewModel = getViewModel()
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "X", "O"],
            ["O", "O", "X"]
        ]
        viewModel.validateDiagonal()
        XCTAssertEqual(viewModel.status, .endGame)
    }
    
    func test_winHorizontal() {
        let viewModel = getViewModel()
        viewModel.gameBoard = [
            ["X", "X", "X"],
            ["X", "X", "O"],
            ["O", "O", "X"]
        ]
        viewModel.validateHorizontal()
        XCTAssertEqual(viewModel.status, .winGame)
    }
    
    func test_winVertical() {
        let viewModel = getViewModel()
        viewModel.gameBoard = [
            ["X", "X", "X"],
            ["X", "X", "O"],
            ["X", "O", "X"]
        ]
        viewModel.validateVertical()
        XCTAssertEqual(viewModel.status, .endGame)
    }
    
    func test_finishGame() {
        let viewModel = getViewModel()
        viewModel.gameBoard = [
            ["X", "X", "X"],
            ["X", "O", "O"],
            ["O", "O", "X"]
        ]
        viewModel.validateFinishedGame()
        XCTAssertEqual(viewModel.status, .endGame)
    }
    
    
    func getViewModel() -> ContentViewModel {
        ContentViewModel()
    }
}
