//
//  DrawingModel.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import Foundation
import SwiftData

@Model
class DrawingModel {
    let id = UUID()
    let title : String
    let canvasData : Data
    
    init(title: String, canvasData: Data) {
        self.title = title
        self.canvasData = canvasData
    }
}
