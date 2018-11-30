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
    var setTaskName = "TaskName"
    let library = TaskLibrary.sharedInstance
    
    //IB Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var completionStackView: UIStackView!
    @IBOutlet weak var completionSwitch: UISwitch!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(task.name)
        setTaskName = task.name
        titleTextField.text = task.name
        titleTextField.isEnabled = false
        descriptionTextView.text = task.description
        descriptionTextView.isEditable = false
        prioritySegment.isHidden = true
        completionStackView.isHidden = true
        if task.completed {
            priorityView.backgroundColor = UIColor(red:0.00, green:0.59, blue:0.00, alpha:1.0)
            prioritySegment.selectedSegmentIndex = 3
            priorityLabel.text = "Completed"
            completionSwitch.isOn = true
        } else {
            completionSwitch.isOn = false
            RefreshPriorityView()
        }
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        titleTextField.isEnabled = true
        descriptionTextView.isEditable = true
        priorityView.isHidden = true
        if task.completed {
            prioritySegment.isHidden = true
        } else {
            prioritySegment.isHidden = false
        }
        completionStackView.isHidden = false
    }
    @IBAction func finishEditingButtonPressed(_ sender: Any) {
        //Tests if any text fields are empty
        guard
            let newTaskName = titleTextField.text, !newTaskName.isEmpty,
            let newTaskDesc = descriptionTextView.text, !newTaskDesc.isEmpty
            else {
                //If so, send an alert
                let errorAlert = UIAlertController(title: "Error", message: "Please fill all text fields.", preferredStyle: UIAlertController.Style.alert)
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in}
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        //Else, set the new task name and priority
        for item in library.tasks {
            if (item.name == setTaskName) {
                item.name = titleTextField.text!
                item.description = descriptionTextView.text!
                item.completed = task.completed
                if !task.completed {
                    switch prioritySegment.selectedSegmentIndex {
                    case 0:
                        item.priority = .low
                    case 1:
                        item.priority = .medium
                    case 2:
                        item.priority = .high
                    default:
                        print("This message should never appear")
                    }
                } else {
                    item.priority = .none
                }
            }
        }
        prioritySegment.isHidden = true
        titleTextField.isEnabled = false
        descriptionTextView.isEditable = false
        RefreshPriorityView()
        priorityView.isHidden = false
        completionStackView.isHidden = true
        
        //Notify the user that the task has been added, sending them back to the main screen
        let completionNotification = UIAlertController(title: "Success!", message: "Your task has been edited.", preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in
        }
        completionNotification.addAction(dismissAction)
        self.present(completionNotification, animated: true, completion: nil)
        return
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        if task.completed {
            task.completed = false
            prioritySegment.isHidden = false
        } else {
            task.completed = true
            task.priority = .none
            prioritySegment.isHidden = true
        }
    }
    
    func RefreshPriorityView() {
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
            priorityLabel.text = "Completed!"
        }
    }
}
