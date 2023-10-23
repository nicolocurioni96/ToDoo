//
//  ToDooApp.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 08/10/23.
//

import SwiftUI
import SwiftData

@main
struct ToDooApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
