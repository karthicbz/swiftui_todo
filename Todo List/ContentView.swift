//
//  ContentView.swift
//  Todo List
//
//  Created by Karthick P on 03/12/25.
//

import SwiftUI

struct TodoList {
    let todo: String
    let isCompleted: Bool
    let id: UUID
}

struct ContentView: View {
    @State private var todoText: String = ""
    @State private var todos: [TodoList] = []

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter a task..", text: $todoText)
                Button("Add") {
                    todos.append(
                        TodoList(todo: todoText, isCompleted: false, id: UUID())
                    )
                    todoText = ""
                }
                .buttonStyle(.borderedProminent)
            }.frame(height: 50)
//            Spacer()
            
            VStack(alignment: .leading) {
                ForEach(todos, id: \.id) { todo in
                    VStack(alignment: .leading){
                        TodoItem(todo: todo.todo, isCompleted: todo.isCompleted)
                        Divider()
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Todo List")
        .padding([.leading, .trailing, .top], 16)
    }
}

#Preview {
    ContentView()
}
