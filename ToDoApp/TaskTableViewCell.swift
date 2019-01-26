//
//  TaskTableViewCell.swift
//  ToDoApp
//
//  Created by Kapil Rathore on 04/10/17.
//  Copyright © 2017 Kapil Rathore. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = UIColor.white
        containerView.makeRounded(radius: 10)
        containerView.dropShadow()
        
        doneButton.backgroundColor = UIColor.white
        doneButton.setTitle(" ", for: .normal)
        doneButton.titleLabel?.textColor = UIColor.black
        doneButton.makeRounded(radius: 12.5)
        doneButton.dropShadow()
        doneButton.dropShadow()
    }
    
    @IBAction func taskCompleted() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
