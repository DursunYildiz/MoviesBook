//
//  MoviesApp.swift
//  Movies
//
//  Created by A101Mac on 23.01.2022.
//

import SwiftUI

@main
struct MoviesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
