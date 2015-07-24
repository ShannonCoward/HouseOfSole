//
//  LoginViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/1/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, UITextFieldDelegate { //FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    @IBAction func loginButton(sender: UIButton) {
        
        PFUser.logInWithUsernameInBackground(usernameTextField.text, password:passwordTextField.text) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                
//                    self.presentViewController(tabBarController, animated: true, completion: nil)
                    self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                
                // Do stuff after successful login.
            } else {
                
                // The login failed. Check error to see why.
            }
            
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
}


