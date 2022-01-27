//
//  ContentView.swift
//  ToDoList
//
//  Created by lilun.ios on 2022/1/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: DefaultStore<AppState>
    var body: some View {
        /*
        Text("\(store.getCurrent().todoData.count)")
            .padding()
        Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Button("Cancel", action: cancelOrder)
        }
         */
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack{
                    Spacer()
                    InputBar(text: "")
                        .frame(idealHeight: 50, maxHeight: 50)
                        .padding(.bottom, 3.0)
                        .ignoresSafeArea()
                }
            }

        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
