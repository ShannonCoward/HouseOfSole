//
//  BioViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/10/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse

class BioViewController: UIViewController {
    
    @IBOutlet weak var userBioPic: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Colleged", size: 20)!]
        
        userBioPic.layer.cornerRadius = 29
        userBioPic.layer.masksToBounds = true
    }
    
    
    @IBAction func editProfileButton(sender: UIButton) {
        
    }
    
    @IBAction func logOutButton(sender: UIButton) {
        
        PFUser.logOut()
        
        if PFUser.currentUser()?.email == nil {
            
            let firstVC = storyboard?.instantiateViewControllerWithIdentifier("firstVC") as! FirstViewController
            
            presentViewController(firstVC, animated: true, completion: nil)
    
                println("\(PFUser.currentUser())loggedOUt")
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
