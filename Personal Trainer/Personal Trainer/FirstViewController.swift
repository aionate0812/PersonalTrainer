//
//  FirstViewController.swift
//  Personal Trainer
//
//  Created by Alexander Onate on 4/27/16.
//  Copyright © 2016 Alexander Onate. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellContent = ["Rob", "Kirsten", "Tommy", "Ralphie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return cellContent.count
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


