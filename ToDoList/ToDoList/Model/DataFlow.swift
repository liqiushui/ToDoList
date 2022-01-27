//
//  DataFlow.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/26.
//

import Foundation

func addCategory(s: AppState, categoryName: String) -> AppState {
    var categorys = s.todoData
    let newCategory = TodoCategory(categoryName: categoryName)
    categorys[newCategory.categoryID] = newCategory
    return AppState(todoData: categorys, searchKey: s.searchKey)
}

func addToDoItem(s: AppState, content: String, categoryID: String) -> AppState {
    var categorys = s.todoData
    if var newCategory = s.todoData[categoryID] {
        /// make item
        let item = TodoItem(categoryID: categoryID, todoContent: content)
        newCategory.itemMap[item.ID] = item
        /// set item to category
        categorys[newCategory.categoryID] = newCategory
    }
    return AppState(todoData: categorys, searchKey: s.searchKey)
}

let todoStateReducer: Reducer<AppState> = { old, action in
    if let action = action as? ToDoAction {
        switch action {
        case .addCategory(let categoryName):
            return addCategory(s: old, categoryName: categoryName)
        case .addTodoItem(let categoryID, let itemContent):
            return addToDoItem(s: old, content: itemContent, categoryID: categoryID)
        case .switchCategory(let categoryID):
            return AppState(todoData: old.todoData,
                            searchKey: old.searchKey,
                            addCategoryID: categoryID)
        default:
            break
        }
    }
    return old
}
