//
//  DetailView.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 29/10/23.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var todoItem: TodoItem
    @State private var canUpdateItem = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            NavigationStack {
                Form {
                    Section {
                        Text(todoItem.name)
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                    
                    Section {
                        Text(DateFormatter.localizedString(from: todoItem.creationDate, dateStyle: .medium, timeStyle: .medium))
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                }
                .navigationTitle(todoItem.name)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button(action: {
                            canUpdateItem = true
                        }, label: {
                            Image(systemName: "pencil.circle.fill")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundStyle(Color.blue)
                        })
                        .sheet(isPresented: $canUpdateItem) {
                            AddItemView(todoItem: todoItem)
                        }
                        
                        Button(action: {
                            delete(todoItem)
                        }, label: {
                            Image(systemName: "trash.circle.fill")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundStyle(Color.red)
                        })
                    }
                }
            }
        }
    }
    
    // MARK: - Private methods
    private func delete(_ item: TodoItem) {
        modelContext.delete(item)
        
        dismiss()
    }
}

#Preview {
    DetailView(todoItem: .init(name: "Test", isChecked: false, creationDate: Date()))
}
