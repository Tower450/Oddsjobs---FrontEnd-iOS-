//
//  RegisterController.swift
//  OddsJobs
//
//  Created by Jonathan Tourangeau on 2016-04-25.
//  Copyright © 2016 DisruptiveInno. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    
    let facebookServices = FacebookServices();
    
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    
    @IBAction func register(sender: AnyObject) {
        
        
        UserWebServices.userWebServices.signUp(emailField.text!, username: usernameField.text! , password: passwordField.text!);
        
        //Si c'est vrai (aucun probleme)
        self.performSegueWithIdentifier("signup_app", sender: self);
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
      
        
    }
    
    
     override func viewDidAppear(animated: Bool) {
        
        
        if (FBSDKAccessToken.currentAccessToken() != nil){
            
            
            
            let userInfo:Dictionary<String,String> = facebookServices.returnFacebookUserData();
            
            print("JE PRINT USERINFO DANS REGISTER");
            print(userInfo["email"]);
           
            /*
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
            UserWebServices.userWebServices.signUp(userInfo["email"]!, username: userInfo["username"]!, password: "testmdp");
                
            })*/
            
            
            self.performSegueWithIdentifier("signup_app", sender: self);

            
            
        }
        else{
            
            facebookServices.showButton(self.view, x: 200, y: 150);
            
        }
        
        
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
