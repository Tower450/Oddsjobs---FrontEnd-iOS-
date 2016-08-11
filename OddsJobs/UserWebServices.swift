//
//  UserWebServices.swift
//  OddsJobs
//
//  Created by Jonathan Tourangeau on 2016-04-25.
//  Copyright © 2016 DisruptiveInno. All rights reserved.
//

import Foundation


class UserWebServices{

    
    static let userWebServices = UserWebServices();
    
    private init(){
    
        
    
    }
    
    
    func signUp(email:String, username:String, password:String){
        
        print("SA RENTRE DANS SIGN UP");
    
        let request = NSMutableURLRequest(URL: NSURL(string: "http://vps74131.vps.ovh.ca:3000/signup")!);
        
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        let params = ["email": email ,"username": username, "password": password] as Dictionary<String, String>
        
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options:[])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            if let urlContent = data{
                
                do{
                    
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers);
                    
                    print("JSON serialization succes");
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        //enlever le optional on doit le wrap avec un if
                        print(jsonResult)
                        
                    })
                }
                catch{
                    
                    print("error JSON serialization");
                    
                }
            }
        })
        
        task.resume()
    }

    func login(email:String, password:String) {
        
        print("SA RENTRE DANS LOGIN");
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://vps74131.vps.ovh.ca:3000/login")!);
        
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        let params = ["email": email, "password": password] as Dictionary<String, String>
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options:[])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            if let urlContent = data{
                
                do{
                    
                    print("a voir");
                    
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers);
                    
                    print("JSON serialization succes");
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        //enlever le optional on doit le wrap avec un if
                        print(jsonResult)
                        
                    })
                }
                catch{
                    
                    print("error JSON serialization");
                    
                }
            }
        })
        
        task.resume()
    }
}