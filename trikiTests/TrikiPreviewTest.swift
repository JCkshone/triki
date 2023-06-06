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

final class TrikiPreviewTest: XCTestCase {
    
    var viewController: UIViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let trikiApp = ContentView()
        viewController = UIHostingController(rootView: trikiApp)
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
    }

    func testDarkModeView() throws {
        let traitDarkMode = UITraitCollection(userInterfaceStyle: UIUserInterfaceStyle.dark)
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX, traits: traitDarkMode)
        )
    }
    
    func testDefaultView() throws {
        assertSnapshot(
          matching: viewController,
          as: .image(on: .iPhoneX)
        )
    }

}
