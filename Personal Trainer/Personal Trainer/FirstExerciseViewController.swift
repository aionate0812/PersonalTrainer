 //
//  FirstExercise.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 4/27/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//


import UIKit
import ImageIO
import AVFoundation
 
class FirstExerciseViewController: UIViewController {
    

    
    var timer = Timer()
    
    var play = false
    
    var mainVar = "test"
    
    
    /*
    
    while(counter<cellContent.count){
    
    bicepCurls.image = UIImage(named:cellContent[counter]+".jpg")
    self.view.addSubview(bicepCurls)
    time++
    timerLabel.text="\(time)"
    if(time>=(counter+1)*15){
    counter++
    }
    }*/
    
    var time = 0
    
    var counter = 0
   
    var cellContent = [String]()
    
    //var bicepCurls : UIImageView
    var bicepCurls  = UIImageView(frame:CGRect(origin: CGPoint(x: 12.5,y :85), size: CGSize(width: 350, height: 275)))
    var timeinseconds = 0
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var bombSoundEffect: AVAudioPlayer!

    
    override func viewDidLoad() {
        
       
        
        
        if(counter>0){
        time=((counter)*15)
        }
        
        super.viewDidLoad()
       cellContent = UserDefaults.standard.object(forKey: mainVar) as! [String]
print(mainVar)
        print(UIScreen.main.bounds.width)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func increaseTimer(){
        
        
        
        if(time<(((counter+1)*10)-5)){

        bicepCurls.image = UIImage(named:cellContent[counter]+".jpg")
        
        self.view.addSubview(bicepCurls)
            print("picture")
            timeinseconds = timeInSeconds()
            print(timeinseconds)
            
        }
        
        else if (time<(((counter+1)*10)) && time>=(((counter+1)*10)-5)){
            self.bicepCurls.removeFromSuperview()
            print("rest")
        }
        
        
        
        
            time += 1
            timerLabel.text="\(time)"
        
            if(time>=(counter+1)*10){
            counter += 1
                if(counter==cellContent.count){
                    print(counter)
                    print(cellContent.count)
                    
                timer.invalidate()
                counter = 0
                    time = 0
                    play=false
                    timerLabel.text="\(time)"
                }
        }
        
    }
    
   
    @IBAction func fastForward(_ sender: AnyObject) {
        if(play==true){
      time=((counter+1)*10)
        counter=counter+1
        }
    }
    @IBAction func restartButton(_ sender: AnyObject) {
        
        if(play==true){
            if(counter>0){
                time=((counter-1)*10)
                counter=counter-1}
            else{
                time = 0
                
                timerLabel.text="0"
            }
        }
        
       
       
        
    }
    
    @IBAction func pauseButton(_ sender: AnyObject) {
        timer.invalidate()
        play=false
    }
    
    @IBAction func playButton(_ sender: AnyObject) {
        
        if(play==false){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FirstExerciseViewController.increaseTimer), userInfo: nil, repeats: true)
        print(counter)
            play=true
        }
        
        let path = Bundle.main.path(forResource: "restSound", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }

        
    }
   
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backBtn" {
            if let destination = segue.destination as? WorkoutExerciseViewController {
                
                destination.mainVar = mainVar
                
            }
        }
    }
    
    func timeInSeconds() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.component(.second, from: date as Date)
        return components
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
