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
    
    //Passes the count of taskArray as the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.tasks.count
    }
    
    //Calls the setup function to display the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //if library.tasks[indexPath.row].completed == true {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        let task = library.tasks[indexPath.row]
        cell.task = task
        cell.setup(task: task)
        
        return cell
    }
    
    @IBAction func unwindToListDisplay(segue: UIStoryboardSegue) { }
    
    //Handles passing the task to the details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailsViewController {
            vc.task = (sender as! TaskCell).task
        }
    }

}
