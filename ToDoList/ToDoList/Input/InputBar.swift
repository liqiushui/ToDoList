//
//  InputBar.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/27.
//

import Foundation
import SwiftUI

struct InputBar: View {
    @State var text: String
    var body: some View {
        ZStack {
            Color.green.opacity(0.5)
            HStack(alignment: .center, spacing: 0) {
                TextField("请输入...", text: $text, onCommit:  {
                    print("已提交")
                })
                .font(Font.system(size: 12.0))
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                .background(Color.white)
                .cornerRadius(5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .strokeBorder(
                            style: StrokeStyle(
                                lineWidth: 1.0,
                                dash: [2]
                            )
                        )
                        .foregroundColor(.gray)
                )
                .padding([.leading, .trailing], 10)
                 AddNewButton()
                .padding(.trailing, 5)
            }
        }.frame(idealHeight: 50, maxHeight: 50)
    }
}
