//
//  TaskListViewController.swift
//  TaskManageriOS
//
//  Created by Ezra Kiteck on 11/26/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IB Outlets
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var completionStatusSegment: UISegmentedControl!
    
    //Gets the shared taskLibrary instance
    let library = TaskLibrary.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the BG picture when loaded
        let imageView = UIImageView(image: UIImage(named: "paperBG.jpg"))
        imageView.frame = self.taskTableView.frame
        self.taskTableView.backgroundView = imageView
        //Fills the task array with preset tasks
        PopulateTasks()
        //Sort and reload list
        library.tasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
        taskTableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Sort and reload list
        library.tasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
        taskTableView.reloadData()
        sortTasks()
    }
    
    //Fills array with preset tasks
    func PopulateTasks() {
        let newTask = Task(name: "Walk the dog", description: "Take the dog for a walk and don't forget the leash", priority: .medium, completed: false)
        library.tasks.append(newTask)
        let otherNewTask = Task(name: "Make a new video game", description: "Start and finish the stressful and exhausting process of completing a video game.", priority: .high, completed: false)
        library.tasks.append(otherNewTask)
        let otherNewTask2 = Task(name: "Be Awesome", description: "DFTBA", priority: .none, completed: true)
        library.tasks.append(otherNewTask2)
    }
    
    func sortTasks() {
        library.completedTasks.removeAll()
        library.incompleteTasks.removeAll()
        for item in library.tasks {
            if item.completed {
                library.completedTasks.append(item)
            } else {
                library.incompleteTasks.append(item)
            }
        }
    }
    
    //Passes the count of taskArray as the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch completionStatusSegment.selectedSegmentIndex {
        case 0:
            return library.tasks.count
        case 1:
            return library.completedTasks.count
        case 2:
            return library.incompleteTasks.count
        default:
            print("This message should never appear")
            return 0
        }
    }
    
    //Calls the setup function to display the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        var task = library.tasks[indexPath.row]
        switch completionStatusSegment.selectedSegmentIndex {
        case 0:
            task = library.tasks[indexPath.row]
        case 1:
            task = library.completedTasks[indexPath.row]
        case 2:
            task = library.incompleteTasks[indexPath.row]
        default:
            print("This message should never appear")
            task = library.tasks[indexPath.row]
        }
        cell.task = task
        cell.setup(task: task)
        
        return cell
    }
    
    //Checks if there is an edit function (this is used to add swipes)
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.library.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Reload the view
            self.taskTableView.reloadData()
        }
        
        let task = library.tasks[indexPath.row]
        
        // If the task is complete, we create and return the 'set as incomplete' action
        // If the game is incomplete, we create and return the 'set as complete' action
        if task.completed {
            let setAsIncomplete = UITableViewRowAction(style: .normal, title: "Set as Incomplete") { _, indexPath in
                task.completed = false
                task.priority = .medium
                self.library.tasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
                self.taskTableView.reloadData()
            }
            //Create a check out action
            return [setAsIncomplete, deleteAction]
            
        } else {
            let setAsComplete = UITableViewRowAction(style: .normal, title: "Complete") { _, indexPath in
                task.completed = true
                task.priority = .none
                self.library.tasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
                self.taskTableView.reloadData()
            }
            //Create a check in action
            return [setAsComplete, deleteAction]
        }
    }
    
    @IBAction func unwindToListDisplay(segue: UIStoryboardSegue) { }
    
    
    @IBAction func completionSegmentTapped(_ sender: Any) {
        sortTasks()
        self.library.tasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
        taskTableView.reloadData()
    }
    
    //Handles passing the task to the details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailsViewController {
            vc.task = (sender as! TaskCell).task
        }
    }

}
