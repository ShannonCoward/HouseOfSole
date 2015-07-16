//
//  MainFeedTableViewCell.swift
//  HouseOfSole
//
//  Created by Shannon Armon on 7/3/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse

class MainFeedTableViewCell: UITableViewCell {
    

    @IBOutlet weak var profilePicImageView: UIImageView!
    
    @IBOutlet weak var postedPicImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var postsTimeStampLabel: UILabel!
    
    @IBAction func likesButton(sender: UIButton) {
        
    }

    
    @IBOutlet weak var commentButton: UIButton!
    

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
}

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
