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
    let library = TaskLibrary.sharedInstance
    
    //IB Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        
    }
    
}
