//
//  SecondViewController.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 4/27/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let workoutSegue = "firstWorkout"
    var thisVar = "try this"
    var cellContent = UserDefaults.standard.object(forKey: "workouts") as! [String]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(cellContent==nil){
        print(true)
        }
        
    }
    
   
    
    
    
    @IBAction func button(_ sender: AnyObject) {
        self.performSegue(withIdentifier: workoutSegue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (cellContent==nil){
        return 0
        }
        else {
        return cellContent.count
    }
    }
    
   
   
   internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
       cell.textLabel?.text = cellContent[indexPath.row]
     return cell
   }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == workoutSegue {
            if let destination = segue.destination as? WorkoutExerciseViewController {
                
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRow(at: path!)
                destination.mainVar = (cell?.textLabel?.text!)!
                
            }
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.indexPathForSelectedRow!
     if let _ = tableView.cellForRow(at: indexPath as IndexPath) {
     self.performSegue(withIdentifier: "firstWorkout", sender: self)
     }
     
    }
 
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
           
           cellContent.remove(at: indexPath.row)
            UserDefaults.standard.setValue(cellContent, forKey: "workouts")
            self.tableView.reloadData()}
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



