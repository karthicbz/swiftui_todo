//
//  ContentView.swift
//  Todo List
//
//  Created by Karthick P on 03/12/25.
//

import SwiftUI
import SwiftData

@Model
class TodoList: Identifiable, Equatable {
    var todo: String
    var isCompleted: Bool
    var id: UUID
    
    init(todo: String, isCompleted: Bool=false, id: UUID=UUID()) {
        self.todo = todo
        self.isCompleted = isCompleted
        self.id = id
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var todoText: String = ""
    @Query private var todos: [TodoList]

//    func deleteTodo(todo: TodoList) {
//        let newTodoList = todos.filter { todoItem in
//            todo.id != todoItem.id
//
//        }
//        todos = newTodoList
//    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter a task..", text: $todoText)
                Button("Add") {
                    if(!todoText.isEmpty){
//                        todos.append(
//                            TodoList(todo: todoText, isCompleted: false, id: UUID())
//                        )
//                        todoText = ""
                        let newTodo = TodoList(todo: todoText)
                        modelContext.insert(newTodo)
                        todoText = ""
                    }
                }
                .buttonStyle(.borderedProminent)
            }.frame(height: 50)
            Text(Date.now, format: .dateTime.day().month().year())
                .font(.title)
                .foregroundColor(.blue)
            if todos.isEmpty {
                Spacer()
                HStack {
                    Text("Currently Empty")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)

                }
                Spacer()
            } else {
                VStack(alignment: .leading) {
                    ForEach(todos.reversed()) { todo in
                        VStack(alignment: .leading) {
                            TodoItem(todo: todo)
                            Divider()
                        }
                    }
                }.animation(.easeIn, value: todos)
                
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
