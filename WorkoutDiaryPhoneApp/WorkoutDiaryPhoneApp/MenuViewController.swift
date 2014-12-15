//
//  DataViewController.swift
//  WorkoutDiaryPhoneApp
//
//  Created by Andrzej Skrodzki on 11/16/14.
//  Copyright (c) 2014 Andrzej Skrodzki. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var userID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FBRequestConnection.startWithGraphPath("me/picture", completionHandler: {
            (FBRequestConnection connection, id result, NSError error) -> Void in
            let a = ""
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

