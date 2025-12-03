//
//  TodoItem.swift
//  Todo List
//
//  Created by Karthick P on 04/12/25.
//

import SwiftUI

struct TodoItem: View {
//    @State private var checked: Bool = false
    let todo:String
    @State var isCompleted: Bool
    var body: some View {
        Button(
            action: {
                self.isCompleted = !self.isCompleted
            },
            label: {
                HStack {
                    Rectangle()
                        .fill((self.isCompleted) ? .green : .white)
                        .frame(width: 20, height: 20)
                        .border(.black, width: 1)
                   Text(todo)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }
            }
        )
    }
}

#Preview {
    TodoItem(todo: "Water Rhino", isCompleted: false)
}
