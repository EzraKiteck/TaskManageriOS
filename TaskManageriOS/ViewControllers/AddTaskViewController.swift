//
//  AddTaskViewController.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/28/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    //Variables
    var newTask: Task?
    var chosenPriority: Task.Priority?
    
    let library = TaskLibrary.sharedInstance
    
    //IB Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        //Tests if any text fields are empty
        guard
            let taskName = taskNameTextField.text, !taskName.isEmpty,
            let taskDesc = descriptionTextView.text, !taskDesc.isEmpty
            else {
                //If so, send an alert
                let errorAlert = UIAlertController(title: "Error", message: "Please fill all text fields.", preferredStyle: UIAlertController.Style.alert)
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in}
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        switch prioritySegment.selectedSegmentIndex {
        case 0:
            chosenPriority = .low
        case 1:
            chosenPriority = .medium
        case 2:
            chosenPriority = .high
        default:
            print("This message should never appear.")
        }
        //Else, create a new task
        newTask = Task(name: taskName, description: taskDesc, priority: chosenPriority!, completed: false)
        library.tasks.append(newTask!)
        
        print(library.tasks)
        
        //And notify the user that the task has been added, sending them back to the main screen
        let completionNotification = UIAlertController(title: "Task Added", message: "'\(newTask!.name)' has successfully been added to your list.", preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in
            self.performSegue(withIdentifier: "UnwindToListDisplay", sender: self)
        }
        completionNotification.addAction(dismissAction)
        self.present(completionNotification, animated: true, completion: nil)
    }
    
}
