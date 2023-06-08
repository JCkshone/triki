//
//  TrikiPreviewTest.swift
//  trikiTests
//
//  Created by Juan Camilo Navarro on 6/06/23.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import triki

@MainActor
final class TrikiPreviewTest: XCTestCase {
    
    var viewController: UIViewController!
    var viewModel: ContentViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = .init()
        let trikiApp = ContentView(viewModel: self.viewModel)
        viewController = UIHostingController(rootView: trikiApp)
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
        viewModel = nil
    }

    func testDarkModeView() throws {
        let traitDarkMode = UITraitCollection(userInterfaceStyle: UIUserInterfaceStyle.dark)
        viewModel.resetGame()
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX, traits: traitDarkMode)
        )
    }
    
    func testDefaultView() throws {
        viewModel.resetGame()
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func testWinLeftDiagonal() throws {
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "X", "O"],
            ["X", "O", "O"]
        ]
        viewModel.validateDiagonal()
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func testHorizontalWin() throws {
        viewModel.gameBoard = [
            ["X", "X", "X"],
            ["X", "X", "O"],
            ["O", "O", "X"]
        ]
        viewModel.validateHorizontal()
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    func testVerticalWin() throws {
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "O", "O"],
            ["x", "O", "X"]
        ]
        viewModel.validateVertical()
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func testLeftDiagonal() throws {
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "X", "O"],
            ["X", "O", "O"]
        ]
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func testRightDiagonal() throws {
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "X", "O"],
            ["O", "O", "X"]
        ]
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func testHorizontal() throws {
        viewModel.gameBoard = [
            ["X", "X", "X"],
            ["X", "X", "O"],
            ["O", "O", "X"]
        ]
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func testVertical() throws {
        viewModel.gameBoard = [
            ["X", "O", "X"],
            ["X", "O", "O"],
            ["x", "O", "X"]
        ]
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }
    
    func getViewModel() -> ContentViewModel {
        ContentViewModel()
    }
}
