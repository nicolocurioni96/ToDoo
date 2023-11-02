//
//  DetailView.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 29/10/23.
//

import SwiftUI

struct DetailView: View {
    @State var todoItem: TodoItem?
    @State private var canUpdateItem = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                Form {
                    Section {
                        Text(todoItem?.name ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                    
                    Section {
                        Text(DateFormatter.localizedString(from: todoItem?.creationDate ?? Date(), dateStyle: .medium, timeStyle: .medium))
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                }
                .navigationTitle(todoItem?.name ?? "")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
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
                    }
                }
            }
        }
    }
}

#Preview {
    DetailView()
}
