//
//  ToDoItem.swift
//  WhoopToDo
//
//  Created by Laticia Chance on 12/4/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import CoreData

class ToDoItem: NSObject {
    
    
    var text : String
    var completed : Bool
    
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
    
}

//extension ToDoItem{

//-----------------MARK : CORE DATA ------------------------
//
//var list: [NSManagedObject] = []
//var lists : [List] = []

//    func coreDataInit() {
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let list = List(context: context)
//
//        list.item = "master protocols and delegates"
//        appDelegate.saveContext()
//
//        do {
//
//            let result = try context.fetch(List.fetchRequest())
//            lists = result as! [List]
//
//            print("HEY: \(lists)")
//
//            //            for list in lists {
//            //
//            //            }
//        } catch {
//            print("Error")
//        }
//
//    }
//}
//
//
