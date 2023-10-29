//
//  AddItemView.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 17/10/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State var todoItem: TodoItem? = nil
    
    var body: some View {
        NavigationStack {
            Form {
                TextField(text: $name) {
                    Text("Item name")
                }
            }
            .navigationTitle("Add Item")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        withAnimation {
                            saveItem()
                            dismiss()
                        }
                    } label: {
                        Text("Save")
                            .font(.title2)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(name.isEmpty)
                }
            }
        }
        .onAppear {
            if let todoItem {
                name = todoItem.name
            }
        }
    }
    
    // MARK: - Private methods
    private func saveItem() {
        if !name.isEmpty {
            if let todoItem {
                // Edit the TODO Item
                todoItem.name = name
            } else {
                // Add a TODO Item
                let todoItem = TodoItem(name: name, isChecked: false, creationDate: Date())
                modelContext.insert(todoItem)
            }
        }
    }
}

#Preview {
    AddItemView()
}
