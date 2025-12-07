//
//  TodoItem.swift
//  Todo List
//
//  Created by Karthick P on 04/12/25.
//

import SwiftUI

struct TodoItem: View {
    @Binding var todo:TodoList
    var deleteTodo: (_ todo:TodoList)->Void
    var body: some View {
        Button(
            action: {
                todo.isCompleted = !todo.isCompleted
            },
            label: {
                HStack {
                    Rectangle()
                        .fill((todo.isCompleted) ? .green : .white)
                        .frame(width: 20, height: 20)
                        .border(.black, width: 1)
                    Text(todo.todo)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                        .strikethrough(todo.isCompleted, color: .black)
                    Spacer()
                    Button("Delete")
                    {
                        deleteTodo(todo)
                    }.tint(.red)
                }
            }
        )
    }
}

#Preview {
    TodoItem(todo: .constant(TodoList(todo: "Water Rhino", isCompleted: false, id: UUID()))) { todo in
    }
}
