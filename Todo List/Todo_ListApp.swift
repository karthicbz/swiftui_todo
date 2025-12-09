//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Karthick P on 03/12/25.
//

import SwiftUI

@main
struct Todo_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: TodoList.self)
        }
    }
}
