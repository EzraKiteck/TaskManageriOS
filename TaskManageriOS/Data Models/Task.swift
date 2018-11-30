//
//  Task.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/28/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

//Task data model
class Task {
    
    enum Priority: Int {
        case high = 3
        case medium = 2
        case low = 1
        case none = 0
    }
    
    //Variables
    var name: String
    var description: String
    var priority: Priority
    var completed: Bool
    
    //Initializer
    init(name: String, description: String, priority: Priority, completed: Bool) {
        self.name = name
        self.description = description
        self.priority = priority
        self.completed = completed
    }

}
