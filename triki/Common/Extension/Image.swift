//
//  Image.swift
//  triki
//
//  Created by Juan Camilo Navarro on 25/05/23.
//

import Foundation
import SwiftUI

typealias TrikiAsset = trikiResources.Assets

extension Image {
    init(with trikiAsset: ImageAsset) {
        self.init(uiImage: trikiAsset.image)
    }
}
