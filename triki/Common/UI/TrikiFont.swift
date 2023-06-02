//
//  TrikiFont.swift
//  triki
//
//  Created by Juan Camilo Navarro on 2/06/23.
//

import Foundation

enum FontDefinition {
    case regular
    case medium
    
    var font: String {
        String(describing: "Poppins-\(self)")
    }
}
