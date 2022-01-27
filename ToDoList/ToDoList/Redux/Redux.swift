//
//  Redux.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/26.
//

import Foundation
import Combine

protocol Action {}

protocol ReduxState {}

typealias Reducer <S: ReduxState> = (S, Action) -> S

// a dispatcher is any function that takes in an action
// and returns nothing
typealias Dispatcher = (Action) -> Void

// a middleware is any function defined on a ReduxState
// that takes in that State, an Action and a Dispatcher
// and returns nothing
typealias Middleware <S: ReduxState> = (S, Action, Dispatcher) -> Void


protocol Store: ObservableObject {
    
    associatedtype S: ReduxState
    
    var reducer: Reducer<S> { get }
    
    var middlewares: [Middleware<S>] { get }
    
    func dispatch(action: Action)
    
    func getCurrent() -> S
}

// implementation of a default Store
class DefaultStore <S: ReduxState>: Store {
    let reducer: Reducer<S>
        
    let middlewares: [Middleware<S>]
    
    @Published private(set) var state: S
    
    init(reducer: @escaping Reducer<S>,
         initialState state: S,
         middlewares: [Middleware<S>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        // create new state
        state = reducer(state, action)
        // and then apply middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
    
    func getCurrent() -> S {
        return state
    }
}
