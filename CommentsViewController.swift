//
//  CommentsViewController.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/24/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Colleged", size: 20)!]

        // Do any additional setup after loading the view.
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
