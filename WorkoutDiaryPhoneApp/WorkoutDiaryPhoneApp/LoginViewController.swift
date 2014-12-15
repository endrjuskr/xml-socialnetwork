//
//  LoginViewController.swift
//  WorkoutDiaryPhoneApp
//
//  Created by Andrzej Skrodzki on 11/16/14.
//  Copyright (c) 2014 Andrzej Skrodzki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBLoginViewDelegate {
    @IBOutlet var fbLoginView : FBLoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile"]
    }


    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        println(auth)
    }

    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }

    @IBAction func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User ID: \(user.objectID)")
        self.performSegueWithIdentifier("testS", sender: nil)
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)

        menuViewController.userID = user.objectID

        self.navigationController?.pushViewController(menuViewController, animated: true)
    }

    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }

    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

