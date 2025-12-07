//
//  ContentView.swift
//  Todo List
//
//  Created by Karthick P on 03/12/25.
//

import SwiftUI

struct TodoList: Identifiable {
    let todo: String
    var isCompleted: Bool
    let id: UUID
}

struct ContentView: View {
    @State private var todoText: String = ""
    @State private var todos: [TodoList] = []
    
    func deleteTodo(todo:TodoList){
        let newTodoList = todos.filter{todoItem in
            todo.id != todoItem.id
            
        }
        todos = newTodoList
    }

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
            VStack(alignment: .leading) {
                ForEach($todos) { $todo in
                    VStack(alignment: .leading) {
                        TodoItem(todo: $todo, deleteTodo: deleteTodo)
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
