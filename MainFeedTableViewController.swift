//
//  MainFeedTableViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/2/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse



class MainFeedTableViewController: UITableViewController,UITabBarControllerDelegate {
    
    
    var userPosts: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Colleged", size: 20)!]
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        _ = UINavigationBar.self
        
        print(PFUser.currentUser()?.email)
        
        if PFUser.currentUser()?.email == nil {
            
            let firstVC = storyboard?.instantiateViewControllerWithIdentifier("firstVC") as! FirstViewController
            
            tabBarController?.presentViewController(firstVC, animated: false, completion: nil)
            
        }
        
        let query = PFQuery(className:"Posts")
        query.includeKey("uploader")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) posts.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    
                    self.userPosts = objects
                   self.tableView.reloadData()
                    
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }

        self.tableView.reloadData()
    }

    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userPosts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mainFeedCell", forIndexPath: indexPath) as! MainFeedTableViewCell
        
        
        cell.profilePicImageView.layer.cornerRadius = 29
        cell.profilePicImageView.layer.masksToBounds = true
        
        _ = NSDate()
        let _: String
        
        if let user = userPosts[indexPath.row]["uploader"] as? PFUser {
            
            print(user)
            
            cell.usernameLabel.text = user.username
            
            if let avatar = user["image"] as? PFFile {
                
                avatar.getDataInBackgroundWithBlock({ (data, error) -> Void in
                    
                    if let image = UIImage(data: data!) {
                        
                        cell.profilePicImageView.image = image
                        
                        cell.profilePicImageView.layer.cornerRadius = 10
                        cell.profilePicImageView.layer.masksToBounds = true
                        
                    }
                    
                })
                
            }
            
        }
        
        if let postedPic = userPosts[indexPath.row]["image"] as? PFFile {
            
            print("Posted Pic \(userPosts[indexPath.row])")
            
            postedPic.getDataInBackgroundWithBlock({ (data, error) -> Void in
                
                if let image = UIImage(data: data!) {
                    
                    cell.postedPicImageView.image = image
                    
                    cell.postedPicImageView.layer.cornerRadius = 10
                    cell.postedPicImageView.layer.masksToBounds = true
                    
                }
                
            })
            
        }
    
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
 
}
