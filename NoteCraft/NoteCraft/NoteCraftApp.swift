//
//  NoteCraftApp.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import SwiftUI
import SwiftData

@main
struct NoteCraftApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Note.self)
     }
}
