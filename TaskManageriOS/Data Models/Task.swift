//
//  Task.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/28/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class Task {
    
    enum Priority: String {
        case high = "High"
        case medium = "Medium"
        case low = "Low"
    }
    
    let name: String
    let description: String
    let priority: Priority
    let completed: Bool
    
    init(name: String, description: String, priority: Priority, completed: Bool) {
        self.name = name
        self.description = description
        self.priority = priority
        self.completed = completed
    }

}
