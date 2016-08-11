//
//  FacebookServices.swift
//  OddsJobs
//
//  Created by Jonathan Tourangeau on 2016-04-25.
//  Copyright © 2016 DisruptiveInno. All rights reserved.
//

import Foundation

class FacebookServices: UIViewController, FBSDKLoginButtonDelegate {
    
    var facebookUserData:Dictionary<String, String> = Dictionary();

    
    func showButton(view:UIView, x:CGFloat, y:CGFloat){
        
        //Looking if the user is already logged in
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            print("Already log");
            print(FBSDKAccessToken.currentAccessToken());
            
            
            
            //Affichage bouton facebook LOGOUT A DES FIN DE TEST
            /*
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            view.addSubview(loginView)
            loginView.center = CGPoint(x: x, y: y)
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self; 
            */
            
            
        }
        else{
            
            //Affichage bouton facebook
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            view.addSubview(loginView)
            loginView.center = CGPoint(x: x, y: y)
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self;
        }
    
    }
    
    //Login by Facebook
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
            print(error);
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                 self.performSegueWithIdentifier("signin_app", sender: self);
            }
            
            
            
            
        }
    }
    
    
    //Logout Facebook
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        //Code implicite qui log out l'usager.
        print("User Logged Out")
        
    }
    
    
    func returnFacebookUserData() -> Dictionary<String, String>
    {
        print("sa rentre dans return");
        var userInfo:Dictionary<String, String> = Dictionary();
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,email,name"])
        
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                
                
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    print("fetched user: \(result)")
                
                    let userName : NSString = result.valueForKey("name") as! NSString
                    userInfo["username"] = userName as String;
                    
                    print("VOICI USER INFO USERNAME" + userInfo["username"]!);
                
                    print("User Name is: \(userName)")
                
                    let userEmail : NSString = result.valueForKey("email") as! NSString
                    userInfo["email"] = userEmail as String;
                  
                    
                    print("User Email is: \(userEmail)")
                    
                  
                })
           
            }
            
            
            userInfo["username"] = result.valueForKey("name") as! String;
            userInfo["email"] = result.valueForKey("email") as! String;
        })
        
        print("PRINT DEDANS RETURN");
        print(userInfo["username"]);
        
        
        return userInfo;
        
    }
    
  
    
    
    
}