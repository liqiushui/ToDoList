//
//  AddNewButton.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/27.
//

import Foundation
import SwiftUI


struct AddNewButton: View {
    @EnvironmentObject var store: DefaultStore<AppState>
    
    static let AddCategoryName = "Add category"
    
    func menuTitle() -> String {
        if let name = store.getCurrent().categoryToAdd()?.categoryName {
            return name
        }
        return Self.AddCategoryName
    }
    
    var body: some View {
        Menu {
            Button(Self.AddCategoryName,
                   action: self.switchCategory(categoryID: nil))
            ForEach(store.getCurrent().sortedCategorys(),
                    id: \.self.categoryID) { c in
                Button(c.categoryName,
                       action: self.switchCategory(categoryID: c.categoryID))
            }
        } label: {
            HStack(alignment: .center, spacing: 1) {
                Text(menuTitle())
                    .font(Font.caption2)
                    .lineLimit(2)
                    .foregroundColor(.black)
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 8, alignment: .center)
                    .padding(.trailing, 3.0)
                    .foregroundColor(.black)
            }.frame(width: 55, height: 30)
        }.background(.white)
         .cornerRadius(10)
         .padding([.leading, .trailing], 2)
         .border(.red)
         .disabled(false)
    }
    
    func switchCategory(categoryID: String?) -> (() -> ()) {
        return { [weak store] in
            print("click switch category \(String(describing: categoryID))")
            store?.dispatch(action: ToDoAction.switchCategory(categoryID: categoryID))
        }
    }
}
