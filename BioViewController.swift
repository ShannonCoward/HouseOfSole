//
//  BioViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/10/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse

class BioViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate {
    
    
    @IBOutlet weak var userBioPic: UIImageView!
    var imagePicker = UIImagePickerController()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Colleged", size: 20)!]
        
        userBioPic.layer.cornerRadius = 29
        userBioPic.layer.masksToBounds = true
        
        _ = PFUser.currentUser()
        
    }

    @IBAction func editProfileButton(sender: UIButton) {
        
        UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        myImageView.contentMode = .ScaleAspectFit
        myImageView.frame = view.frame
        myImageView.contentMode = UIViewContentMode.ScaleAspectFill
        view.addSubview(myImageView)
        
        tabBarController?.hidesBottomBarWhenPushed
        
        self.view.addSubview(imagePicker.view)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let theINfo:NSDictionary = info as NSDictionary
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            print(pickedImage)
            userBioPic.contentMode = .ScaleAspectFit
            userBioPic.image = pickedImage
            
            let file = PFFile(data: UIImagePNGRepresentation(pickedImage)!)
            PFUser.currentUser()?.setObject(file, forKey: "image")
            PFUser.currentUser()?.saveInBackground()
            
            dismissViewControllerAnimated(true, completion: nil)
            
        }
     
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        print(self.tabBarController?.viewControllers)
        
        if let tabBarControl = self.tabBarController?.viewControllers {
            if let bioVC = tabBarControl[2] as? BioViewController {
                tabBarController?.selectedIndex = 0
                
                
            }
        }
        
        
    }
    
    
    
    @IBAction func logOutButton(sender: UIButton) {
        
        PFUser.logOut()
        
        if PFUser.currentUser()?.email == nil {
            
            let firstVC = storyboard?.instantiateViewControllerWithIdentifier("firstVC") as! FirstViewController
            
            presentViewController(firstVC, animated: true, completion: nil)
            
            print("\(PFUser.currentUser())loggedOUt")
            
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
