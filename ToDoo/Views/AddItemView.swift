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
                        if !name.isEmpty {
                            let todoItem = TodoItem(name: name, isChecked: false, creationDate: Date())
                            modelContext.insert(todoItem)
                            
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
    }
}

#Preview {
    AddItemView()
}
