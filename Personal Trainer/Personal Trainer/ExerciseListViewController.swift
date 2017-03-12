//
//  ExerciseListViewController.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 6/6/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//


import UIKit
class ExerciseListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        
        

    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var titleNavBar: UINavigationItem!
        var cellContent = ["Bicep curls", "Jumping jack", "Squat", "Mummy", "Ab Crunch Machine", "Ab Roller", "Air Bike", "Around The World", "Barbell Bench Press", "Barbell Bench Press Wide Grip", "Barbell Curl", "Barbell Full Squat", "Barbell Lunge", "Bench Dips", "Bench Jump", "Bench Sprint", "Bent Over Barbell Row", "Bent Over Two Dumbell Row", "Bicep Curl To Shoulder Press", "Bodyweight Flyes", "Bodyweight Lunge", "Bodyweight Squat", "Bottoms Up", "Box Jump", "ButterFly", "Cable Crossover", "Cable Hammer Curls", "Cable Incline Push Down"]
    
    
        var cellExercises = ["Bicepcurls", "Jumpingjack", "Squat", "Mummy", "AbCrunchMachine", "AbRoller", "AirBike", "AroundTheWorld", "BarbellBenchPress", "BarbellBenchPressWideGrip", "BarbellCurl", "BarbellFullSquat", "BarbellLunge", "BenchDips", "BenchJump", "BenchSprint", "BentOverBarbellRow", "BentOverLongBarRow", "BentOverTwoDumbellRow", "BicepCurlToShoulderPress", "BodyweightFlyes", "BodyweightLunge", "BodyweightSquat", "BottomsUp", "BoxJump", "Butterfly", "CableCrossover", "CableHammerCurls", "CableInclinePushDown"]
    
    
        var passingArray = [String]()
        var mainVar = "A"
        let workoutSegue = "doneBtnExercise"
        let cancelbtnSegue = "cancelbtnSegue"
        var test = ""
    
    @IBAction func doneButton(_ sender: AnyObject) {
        if tableView.indexPathsForSelectedRows != nil{
            
            let rowsSelected = tableView.indexPathsForSelectedRows
            
            
            for x in rowsSelected!{
                print(cellExercises[x.row])
                
                passingArray.append(cellExercises[x.row])
                
            }
            UserDefaults.standard.set(passingArray, forKey: mainVar)
        }
    }
        
    @IBAction func Button(_ sender: AnyObject) {
        if tableView.indexPathsForSelectedRows != nil{
            
            let rowsSelected = tableView.indexPathsForSelectedRows
           
            
            for x in rowsSelected!{
                print(cellExercises[x.row])
             
                passingArray.append(cellExercises[x.row])
               
            }
            UserDefaults.standard.set(passingArray, forKey: mainVar)
        }
    }
  
    /*if tableView.indexPathsForSelectedRows != nil{
    
    let rowsSelected = tableView.indexPathsForSelectedRows
    
    
    for x in rowsSelected!{
    print(cellExercises[x.row])
    passingArray[x.row]=cellExercises[x.row]
    
    }
    NSUserDefaults.standardUserDefaults().setObject(passingArray, forKey: mainVar)
    }*/
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            titleNavBar.title = mainVar
            tableView.allowsMultipleSelection = true
            print(mainVar)
            test = mainVar
        }
        
        
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return cellExercises.count
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == workoutSegue || segue.identifier == cancelbtnSegue {
            if let destination = segue.destination as? WorkoutExerciseViewController {
                
             destination.mainVar = test
                
            }
        }
    }
    
        
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
            
            cell.textLabel?.text = cellContent[indexPath.row]
            
            return cell
            
        }
    
    
        
  
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}
