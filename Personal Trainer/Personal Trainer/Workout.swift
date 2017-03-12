//
//  Workout.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 5/13/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//

import UIKit

class Workout {
    
    var exercisesList=[Exercise]()
    var exercisesNames=[String]()
    var exercisesTime=[Int]()
    
    init(exercisesList:[String], exercisesTime:[Int]){
        exercisesNames = exercisesList
        self.exercisesTime = exercisesTime
        createExerciseList(namesArray: exercisesList, timeArray: exercisesTime)
        
    }
    
    
    func createExerciseList(namesArray:[String], timeArray:[Int]){
        
        for x in exercisesTime{
        let exercise=Exercise(name:namesArray[x],time:timeArray[x])
        exercisesList.append(exercise)
        }
    
    }
    
    
    
}
