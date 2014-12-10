//
//  DataViewController.swift
//  WorkoutDiaryPhoneApp
//
//  Created by Andrzej Skrodzki on 11/16/14.
//  Copyright (c) 2014 Andrzej Skrodzki. All rights reserved.
//

import UIKit
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FBLoginViewDelegate, GPPSignInDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    @IBOutlet var signInGoogleP : GPPSignIn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]

        signInGoogleP = GPPSignIn.sharedInstance()
        signInGoogleP?.shouldFetchGooglePlusUser = true
        signInGoogleP?.clientID = "clientID"
        signInGoogleP?.scopes = [ kGTLAuthScopePlusLogin ];
        signInGoogleP?.delegate = self;
    }
    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        println(auth)
    }
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:    Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        cell.textLabel?.text = "Row #\(indexPath.row)"
        cell.detailTextLabel?.text = "Subtitle #\(indexPath.row)"
        
        return cell
    }
}

