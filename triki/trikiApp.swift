//
//  trikiApp.swift
//  triki
//
//  Created by Juan Camilo Navarro on 25/05/23.
//

import SwiftUI

@main
struct trikiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
