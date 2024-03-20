//
//  Weatherapp_SwiftUIApp.swift
//  Weatherapp-SwiftUI
//
//  Created by Nishant Deshmukh on 19/03/24.
//

import SwiftUI

@main
struct Weatherapp_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
