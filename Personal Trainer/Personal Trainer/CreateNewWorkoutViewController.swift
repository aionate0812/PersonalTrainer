//
//  CreateNewWorkoutViewController.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 5/20/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//

import UIKit

class CreateNewWorkoutViewController: UIViewController {
    
    var userWorkouts: UserDefaults = UserDefaults.standard
    
   
    @IBOutlet weak var workoutName: UITextField!
  var workoutsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func createButton(_ sender: AnyObject) {
        if ((userWorkouts.object(forKey: "workouts")) != nil){
            workoutsList = userWorkouts.object(forKey: "workouts") as! Array!
            workoutsList.append(workoutName.text!)
            userWorkouts.setValue(workoutsList, forKey: "workouts")
            print("1 ", workoutsList)
        }
        else{
            
            workoutsList.append((workoutName.text?.uppercased())!)
            userWorkouts.setValue(workoutsList, forKey: "workouts")
            print("2", workoutsList)
        }
    }
    
        
            
    
        
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
