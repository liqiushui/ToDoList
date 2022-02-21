//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by ddyt on 2022/1/26.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let store: DefaultStore<AppState>
    
    init() {
        store = DefaultStore<AppState>(
            reducer: todoStateReducer,
            initialState: AppState(),
            middlewares: [load, storage]
        )
        store.dispatch(action: ToDoAction.loadCacheState)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
