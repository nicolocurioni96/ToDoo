//
//  ContentView.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 08/10/23.
//

import SwiftUI

struct ContentView: View {
    var todoItems: [String] = ["Bread", "Sugar", "Cake"]
    
    var body: some View {
        ZStack {
            NavigationStack {
                if todoItems.isEmpty {
                    HStack {
                        Text("Add new item")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.blue)
                            .bold()
                        
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(Color.blue)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(todoItems, id: \.self) { todoItem in
                            Text(todoItem)
                        }
                    }
                    .navigationTitle("ToDoo")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                debugPrint("Add New Item")
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundStyle(Color.blue)
                            })
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
