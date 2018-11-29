//
//  DetailsViewController.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/29/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //Variables
    var task = Task(name: "Take out the Trash", description: "Description", priority: .none, completed: true)
    
    //IB Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var priorityLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(task.name)
        titleTextField.text = task.name
        titleTextField.isEnabled = false
        descriptionTextView.text = task.description
        descriptionTextView.isEditable = false
        prioritySegment.isHidden = true
        if task.completed {
            priorityView.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.00, alpha:1.0)
            prioritySegment.selectedSegmentIndex = 3
            priorityLabel.text = "Completed"
        } else {
            switch task.priority {
            case .high:
                priorityView.backgroundColor = .red
                prioritySegment.selectedSegmentIndex = 2
                priorityLabel.text = "You should really get this done!"
            case .medium:
                priorityView.backgroundColor = UIColor(red:1.00, green:0.72, blue:0.00, alpha:1.0)
                prioritySegment.selectedSegmentIndex = 1
                priorityLabel.text = "This is important."
            case .low:
                priorityView.backgroundColor = UIColor(red:0.28, green:0.79, blue:1.00, alpha:1.0)
                prioritySegment.selectedSegmentIndex = 0
                priorityLabel.text = "Don't forget to get to this."
            case .none:
                priorityView.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.00, alpha:1.0)
                prioritySegment.selectedSegmentIndex = 3
                priorityLabel.text = "Completed!"
            }
        }
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        titleTextField.isEnabled = true
        descriptionTextView.isEditable = true
        priorityView.isHidden = true
    }
    @IBAction func finishEditingButtonPressed(_ sender: Any) {
        titleTextField.isEnabled = false
        descriptionTextView.isEditable = false
        priorityView.isHidden = false
    }
}
