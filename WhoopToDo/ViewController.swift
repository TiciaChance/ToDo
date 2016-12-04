//
//  ViewController.swift
//  WhoopToDo
//
//  Created by Laticia Chance on 12/3/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var list: [NSManagedObject] = []
    var lists : [List] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataInit()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        
        let listItem = lists[indexPath.row]
        cell.textLabel?.text = listItem.item
        
        return cell
    }
    
}

extension ViewController {
    
    func coreDataInit() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let list = List(context: context)
        
        //list.item = "master protocols and delegates"
        appDelegate.saveContext()
        
        do {
            
            let result = try context.fetch(List.fetchRequest())
            lists = result as! [List]
            
            for list in lists {
                
                print("Item: \(list.item)")
            }
        } catch {
            print("Error")
        }
        
    }

}
