//
//  ToDoItem.swift
//  WhoopToDo
//
//  Created by Laticia Chance on 12/4/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {

    var text : String
    var completed : Bool
    
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
}
