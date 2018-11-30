//
//  TaskLibrary.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/28/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class TaskLibrary {
    //Singleton
    static let sharedInstance = TaskLibrary()
    
    var tasks = [Task]()
    var completedTasks = [Task]()
    var incompleteTasks = [Task]()
}
