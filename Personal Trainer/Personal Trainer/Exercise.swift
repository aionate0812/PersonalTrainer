//
//  Exercise.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 5/13/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//

import UIKit

class Exercise {
    
    var imageView : UIImageView
    var name:String
    var time:Int
    
    
    
    init(name:String, time:Int){
        imageView  = UIImageView(frame:CGRect(origin: CGPoint(x: 65,y :80), size: CGSize(width: 200, height: 200)));
        
        imageView.image = UIImage(named:name+".jpg")
        self.name=name
        self.time=time
    }
    func getName()->String{
    return name
    }
    func getTime()->Int{
    return time
    }
    func getImage()->UIImageView{
    return imageView
    }
    
    
    
  
    
}
