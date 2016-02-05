//
//  ViewController.swift
//  ChatApp
//
//  Created by Franky Liang on 2/4/16.
//  Copyright © 2016 Franky Liang. All rights reserved.
//
import Parse
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(sender: AnyObject) {
        var user = PFUser()
        user.username = usernameInput.text;
        user.password = passwordInput.text;
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
            
    }
    }
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
    PFUser.logInWithUsernameInBackground(usernameInput.text!, password: passwordInput.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
               self.performSegueWithIdentifier("chatSegue", sender: self)
            } else {
                // The login failed. Check error to see why.
            }
        }
}
}
