//
//  Item.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
