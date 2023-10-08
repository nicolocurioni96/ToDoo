//
//  ContentView.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 08/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Add new item")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.red)
                    .bold()
                
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(Color.blue)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
