//
//  TodoModel.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/26.
//

import Foundation

struct TodoItem: Codable {
    /// uuid
    let ID: String
    /// create timestamp inteval, unit ms
    let createTS: Double
    /// category ID, uuid
    let categoryID: String
    /// content
    let todoContent: String
    
    init(categoryID: String, todoContent: String) {
        ID = UUID().uuidString
        createTS = Date().timeIntervalSince1970
        self.categoryID = categoryID
        self.todoContent = todoContent
    }
}

struct TodoCategory: Codable {
    /// uuid
    let categoryID: String
    /// create timestamp inteval, unit ms
    let createTS: Double
    /// content
    let categoryName: String
    /// todo items, key: TodoItem.ID, value: TodoItem
    var itemMap: [String: TodoItem]
    
    init(categoryName: String) {
        categoryID = UUID().uuidString
        createTS = Date().timeIntervalSince1970
        self.categoryName = categoryName
        itemMap = [:]
    }
}
