//
//  WorkoutExercisesViewController.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 6/3/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//

import UIKit

class WorkoutExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var titleNavBar: UINavigationItem!
   
    var mainVar = "lets see"
    
    var cellContent = [String]()
 
    @IBAction func editWorkoutBtn(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        titleNavBar.title = mainVar
       if (UserDefaults.standard.object(forKey: mainVar) != nil ){
       cellContent = UserDefaults.standard.object(forKey: mainVar) as! [String]
       tableView.reloadData()
        }
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exerciseListVCSegue" {
            if let destination = segue.destination as? ExerciseListViewController {
                
                destination.mainVar = titleNavBar.title!
                
            }
        }
            if segue.identifier == "playRoutineSegue" {
                if let destination = segue.destination as? FirstExerciseViewController {
                    
                    destination.mainVar = titleNavBar.title!
                    destination.counter = (tableView.indexPathForSelectedRow?.row)!
                    
                }
            }
        
        }
 
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(cellContent==nil){
            return 0
        }
        else {
            return cellContent.count
        }
    }
    
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @nonobjc func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            UserDefaults.standard.removeObject(forKey: cellContent[indexPath.row])
            cellContent.remove(at: indexPath.row)
            self.tableView.reloadData()}
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRow(at: indexPath as IndexPath) {
            self.performSegue(withIdentifier: "playRoutineSegue", sender: self)
        }
        
    }
    
    
    

}
