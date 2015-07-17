//
//  EditBioViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/17/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse

class EditBioViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    var myImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func editProfilePicture(sender: AnyObject) {
        
        UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        
        
        myImageView.frame = view.frame
        myImageView.contentMode = UIViewContentMode.ScaleAspectFill
        view.addSubview(myImageView)
        
        tabBarController?.hidesBottomBarWhenPushed
        
        self.view.addSubview(imagePicker.view)
        
    }

    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
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
