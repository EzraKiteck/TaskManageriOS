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
    
    //Array of all tasks (Task data type has not been created yet)
    var taskArray: [String] = ["Hello, World!"]
    
    //Sets the BG picture when loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "paperBG.jpg"))
        imageView.frame = self.taskTableView.frame
        self.taskTableView.backgroundView = imageView
    }
    
    //Passes the count of taskArray as the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    //Calls the setup function to display the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        cell.setup()
        
        return cell
    }
    

}
