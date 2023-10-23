//
//  TodoItem.swift
//  ToDoo
//
//  Created by Nicolò Curioni on 17/10/23.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var id = UUID().uuidString
    var name: String
    var isChecked: Bool
    var creationDate: Date
    
    init(id: String = UUID().uuidString, name: String, isChecked: Bool, creationDate: Date) {
        self.id = id
        self.name = name
        self.isChecked = isChecked
        self.creationDate = creationDate
    }
}
