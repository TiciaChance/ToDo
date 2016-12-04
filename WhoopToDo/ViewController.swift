//
//  ViewController.swift
//  WhoopToDo
//
//  Created by Laticia Chance on 12/3/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var list: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataInit()
        
    }
    
    func coreDataInit() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let list = List(context: context)
        
        //list.item = "master protocols and delegates"
        appDelegate.saveContext()
        
        do {
            
            let result = try context.fetch(List.fetchRequest())
            let lists = result as! [List]
            
            for list in lists {
                
                print("Item: \(list.item)")
            }
        } catch {
            print("Error")
        }
        
    }
    
    
}

