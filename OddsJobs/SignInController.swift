//
//  SignInController.swift
//  OddsJobs
//
//  Created by Jonathan Tourangeau on 2016-04-25.
//  Copyright © 2016 DisruptiveInno. All rights reserved.
//

import UIKit



class SignInController: UIViewController {
    
    
    let facebookServices = FacebookServices();
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func returnUserDataAction(sender: AnyObject) {
        
       if (FBSDKAccessToken.currentAccessToken() != nil){
            
        facebookServices.returnFacebookUserData();
        
        }
        else{
        
            print("The user is not logged in");
        
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
    
        if (FBSDKAccessToken.currentAccessToken() != nil){
            
            self.performSegueWithIdentifier("signin_app", sender: self);
            
        }
        else{
            
            facebookServices.showButton(self.view, x: 200, y: 150);
            
        }
    
    }
    
    
    //Login directly to our database
    @IBAction func signIn(sender: AnyObject) {
        
        UserWebServices.userWebServices.login(emailField.text!, password: passwordField.text!);
        
        //Si c'est vrai (aucun probleme)
        self.performSegueWithIdentifier("signin_app", sender: self);
        
    }
    
    /**** GESTION COMPORTEMENT******/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    //Gestion clavier
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true);
        
    }
    
}
