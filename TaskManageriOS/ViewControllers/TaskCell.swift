//
//  TaskCell.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/26/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    //Variables to test the priority view
    let priority = "low"
    let completed = false
    
    var task = Task(name: "Walk the dog", description: "Take the dog for a walk and don't forget the leash", priority: .medium, completed: false)
    
    //IB Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //Adds label and sets priority for the task
    func setup(task: Task) {
        taskNameLabel.text = task.name
        descriptionLabel.text = task.description
        //Transparent BG
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        //Sets priority view
        if task.completed {
            priorityView.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.00, alpha:1.0)
            priorityLabel.text = "✓"
        } else {
            switch task.priority {
            case .high:
                priorityView.backgroundColor = .red
                priorityLabel.text = "!!!"
            case .medium:
                priorityView.backgroundColor = UIColor(red:1.00, green:0.72, blue:0.00, alpha:1.0)
                priorityLabel.text = "!!"
            case .low:
                priorityView.backgroundColor = UIColor(red:0.28, green:0.79, blue:1.00, alpha:1.0)
                priorityLabel.text = "!"
            case .none:
                print("This message should never appear")
            }
            
        }
    }
    
}
