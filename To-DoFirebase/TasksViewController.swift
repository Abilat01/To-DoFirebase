//
//  TasksViewController.swift
//  To-DoFirebase
//
//  Created by Danya on 23.09.2021.
//

import UIKit
import Firebase

class TasksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tasks: [String] = ["Cell", "f", "fd", "fd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newTasksTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func singOutTapped(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
}



extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = "This is cell #\(indexPath.row)"
        
        return cell
    }
    
}
