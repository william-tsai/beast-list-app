//
//  ViewController.swift
//  beastListApp
//
//  Created by William Tsai on 1/15/18.
//  Copyright © 2018 William Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

    @IBOutlet var taskTextField: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func beastBtnPressed(_ sender: UIButton) {
        if let newTask = taskTextField.text {
            tasks.append(newTask)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

// Below extension can be included in the class ViewController if it is "conformed" to the UITableViewDataSource protocol
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
