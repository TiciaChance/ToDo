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
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 50.0
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textLabel?.backgroundColor = UIColor.clear
        
        let listItem = lists[indexPath.row]
        cell.textLabel?.text = listItem.item
        
        return cell
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = lists.count - 1
        let val = CGFloat(index) / CGFloat(itemCount) * 0.6
        return UIColor(red: val, green: val, blue: 20.0, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        cell.textLabel?.textColor = UIColor.white
    }
    
}

extension ViewController {
    
    func coreDataInit() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let list = List(context: context)
        
        list.item = "master protocols and delegates"
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
