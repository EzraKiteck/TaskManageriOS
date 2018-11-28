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
        taskTableView.reloadData()
        
    }
    
    func PopulateTasks() {
        let newTask = Task(name: "Walk the dog", description: "Take the dog for a walk and don't forget the leash", priority: .medium)
        library.tasks.append(newTask)
        let otherNewTask = Task(name: "Make a new video game", description: "Start and finish the stressful and exhausting process of completing a video game.", priority: .high)
        library.tasks.append(otherNewTask)
    }
    
    //Passes the count of taskArray as the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.tasks.count
    }
    
    //Calls the setup function to display the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        cell.setup()
        
        return cell
    }
    

}
