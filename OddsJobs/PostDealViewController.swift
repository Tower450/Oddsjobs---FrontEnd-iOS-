//
//  PostDealViewController.swift
//  OddsJobs
//
//  Created by Jonathan Tourangeau on 2016-05-10.
//  Copyright © 2016 DisruptiveInno. All rights reserved.

//
import UIKit

class PostDealViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var activityIndicator = UIActivityIndicatorView();
    
    
    @IBOutlet var imageToPost: UIImageView!
    
  
    @IBAction func chooseImage(sender: AnyObject) {
        
        let image = UIImagePickerController();
        image.delegate  = self;
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        image.allowsEditing = false;
        
        self.presentViewController(image, animated: true, completion:nil);
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.dismissViewControllerAnimated(true, completion: nil);
        
        imageToPost.image = image;
        
    }
    
  
    @IBOutlet var message: UITextField!
    

    @IBAction func postDeal(sender: AnyObject) {
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame);
        activityIndicator.backgroundColor = UIColor(white: 1.0 , alpha:  0.5);
        activityIndicator.center = self.view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray;
        
        view.addSubview(activityIndicator);
        activityIndicator.startAnimating();
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents();
        
        
        //Enregistrement par webservices des posts.
        /*
            Voici les informations a garder dans la base de donnees:

            - Image du l'item.
            - Message du post.
            - Donnee de Geolocalisation.

        */
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func displayAlert(title:String, message:String){
        
        if #available(iOS 8.0, *) {
            
            var alert = UIAlertController(title:title, message: message , preferredStyle: UIAlertControllerStyle.Alert )
            
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                
                self.dismissViewControllerAnimated(true, completion: nil);
                
                
            }))
            
            
            self.presentViewController(alert, animated: true, completion: nil);
            
        } else {
            
            // Fallback on earlier versions
            
        }
        
        
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
