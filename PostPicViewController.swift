//
//  PostPicViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/3/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse
import Bolts

class PostPicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate {
    
    

    var imagePicker = UIImagePickerController()
    
    //    var tabBarPicker = UITabBarControllerDelegate.self
    
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        optional func tabBarController(_ tabBarController: UITabBarController,
        //            shouldSelectViewController viewController: UIViewController) -> Bool
        
        
        
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        
        
        myImageView.frame = view.frame
        myImageView.contentMode = UIViewContentMode.ScaleAspectFill
        view.addSubview(myImageView)
        
        tabBarController?.hidesBottomBarWhenPushed
        
    }
    
    // will keep from presenting after pic has been taken
    var posted = false
    
    override func viewWillAppear(animated: Bool) {
        
        if posted {
            
            posted = false
            return
        
        }
        
        presentViewController(imagePicker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let newImage = RBResizeImage(image, CGSizeMake(400, 550))
            myImageView.image = image
            
            self.posted = true
            
            picker.dismissViewControllerAnimated(true, completion: nil)
            
            var post = PFObject(className: "Posts")
            post["uploader"] = PFUser.currentUser()
            
            let imageData = UIImagePNGRepresentation(newImage)
            let imageFile = PFFile(name:"image.png", data:imageData)
            post["image"] = imageFile
            
            // add post to userPosts
            
           
            
            post.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                
                
                
            })
            
        }
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)

        
        println(self.tabBarController?.viewControllers)
        
        if let tabBarControl = self.tabBarController?.viewControllers {
            if let firstVC = tabBarControl[0] as? MainFeedTableViewController {
                tabBarController?.selectedIndex = 0
            }
        }
        
        
//        tabBarController?.presentViewController(homeFeedVC, animated: false, completion: nil)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}