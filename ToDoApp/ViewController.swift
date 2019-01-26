//
//  ViewController.swift
//  ToDoApp
//
//  Created by Kapil Rathore on 04/10/17.
//  Copyright © 2017 Kapil Rathore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.separatorStyle = .none
        taskTableView.rowHeight = UITableViewAutomaticDimension
        taskTableView.estimatedRowHeight = 40
//        taskTableView.allowsSelection = false
        
        taskTableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "taskTVC")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Components.taskDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskTVC") as! TaskTableViewCell
        
        let task = Components.taskDict[indexPath.row]
        
//        cell.taskLabel.text = task.name
        
        if task.completed {
            
            cell.taskLabel.text = ""
            
            let attributedString = NSMutableAttributedString(string: task.name)
            attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue), range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSAttributedStringKey.strikethroughColor, value: UIColor.gray, range: NSMakeRange(0, attributedString.length))
            cell.taskLabel.attributedText = attributedString
            
            cell.doneButton.backgroundColor = Components.greenColour
            cell.taskLabel.textColor = UIColor.lightGray
        } else {
            
            cell.taskLabel.attributedText = NSMutableAttributedString(string: "")
            cell.taskLabel.text = task.name
            
            cell.doneButton.backgroundColor = UIColor.white
            cell.taskLabel.textColor = UIColor.black
        }
        
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = Components.taskDict[indexPath.row]
        
        task.completed = !task.completed
        
        tableView.beginUpdates()
        let last = Components.taskDict.count
        Components.taskDict.rearrange(from: indexPath.row, to: last-1)
//        let indexPath1 = IndexPath(row: last-1, section: 0)
        self.taskTableView.reloadSections(IndexSet(integer: 0), with: .fade)
//        self.taskTableView.reloadRows(at: [indexPath], with: .left)
        tableView.endUpdates()
        
//        UIView.animate(withDuration: 0.2) {
//
//        }
    }
}

extension Array {
    mutating func rearrange(from: Int, to: Int) {
        precondition(from != to && indices.contains(from) && indices.contains(to), "invalid indexes")
        insert(remove(at: from), at: to)
    }
}
