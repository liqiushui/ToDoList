//
//  ToDoList.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/28.
//

import Foundation
import SwiftUI

struct ToDoList: View {
    @EnvironmentObject var store: DefaultStore<AppState>
    
    func categoryHeader(name: String) -> some View {
        Text(name)
            .foregroundColor(.black)
            .font(Font.caption)
            .fontWeight(.bold)
            .lineLimit(1)
    }
    
    var body: some View {
        List() {
            let categorys = store.getCurrent().sortedCategorys()
            ForEach(categorys, id: \.categoryID) { category in
                Section(header: categoryHeader(name: category.categoryName)) {
                    if category.isEmpty {
                        Text("Empty Todo, click bottom add menu")
                    } else {
                        ForEach(category.displayTodos(), id: \.listID) { item in
                            ToToItemCell(initem: item)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .background(Color("listbg"))
        .listRowSeparator(Visibility.hidden)
    }
}
