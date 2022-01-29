//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/26.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let store: DefaultStore<AppState>
    
    init() {
        store = DefaultStore<AppState>(
            reducer: todoStateReducer,
            initialState: loadAppState() ?? AppState(),
            middlewares: [storage]
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
