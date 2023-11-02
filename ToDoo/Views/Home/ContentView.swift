//
//  HomeView.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 08/10/23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var todoItems: [TodoItem]
    @State private var showAddNewItem = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                if todoItems.isEmpty {
                    HStack {
                        Text("Add new item")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.blue)
                            .bold()
                        
                        Button(action: {
                            showAddNewItem = true
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundStyle(Color.blue)
                        })
                        .sheet(isPresented: $showAddNewItem) {
                            AddItemView()
                        }
                    }
                    .padding()
                } else {
                    List {
                        ForEach(todoItems, id: \.self) { todoItem in
                            NavigationLink {
                                DetailView(todoItem: todoItem)
                            } label: {
                                Text(todoItem.name)
                            }

                        }
                    }
                    .navigationTitle("ToDoo")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                showAddNewItem = true
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundStyle(Color.blue)
                            })
                            .sheet(isPresented: $showAddNewItem) {
                                AddItemView()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
