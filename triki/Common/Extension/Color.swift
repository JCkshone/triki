//
//  Color.swift
//  triki
//
//  Created by Juan Camilo Navarro on 25/05/23.
//

import Foundation
import SwiftUI
import UIKit

typealias TrikiColor = trikiResources.Colors

extension View {
    func foregroundColor(with trikiColor: ColorAsset) -> some View {
        self.foregroundColor(trikiColor.swiftUIColor)
    }
    
    func background(with trikiColor: ColorAsset) -> some View {
        self.background(trikiColor.swiftUIColor)
    }
}
