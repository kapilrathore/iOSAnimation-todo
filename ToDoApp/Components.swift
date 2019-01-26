//
//  Components.swift
//  ToDoApp
//
//  Created by Kapil Rathore on 04/10/17.
//  Copyright © 2017 Kapil Rathore. All rights reserved.
//

import UIKit

class Task {
    
    var name: String
    var completed: Bool
    
    init(name: String, completed: Bool) {
        self.name = name
        self.completed = completed
    }
}

struct Components {
    
    static let greenColour = UIColor.init(red: 7/255, green: 193/255, blue: 125/255, alpha: 1)
    
    static var taskDict: [Task] = [
        Task(name: "Installing This App", completed: false),
        Task(name: "Getting Start: The Basics", completed: false),
        Task(name: "Gluing Our Views Together: The storyboard", completed: false),
        Task(name: "Create a table view controller", completed: false),
        Task(name: "Add a navigation controller to the view controller", completed: false),
        Task(name: "Finally Programming: Swift", completed: false),
        Task(name: "Create a custom table view controller that is a subclass of UITableViewController", completed: false),
        Task(name: "Connecting cancel and done buttons to exit segue", completed: false),
        Task(name: "Create a Data Class", completed: false)
    ]
}

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 5
    }
}
