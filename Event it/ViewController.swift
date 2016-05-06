//
//  ViewController.swift
//  Event it
//
//  Created by Luis Felipe Salazar on 10/10/15.
//  Copyright © 2015 Luis Felipe Salazar. All rights reserved.
//
//f2bfadfa33bd94905e53db831e2f9104
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var nombre = ""
    var apellido = ""
    var correo = ""
    var imagen = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (FBSDKAccessToken.currentAccessToken() == nil){
            print("Error de inicio de sesion")
        }
        else{
            print("Sesion iniciada")
        }
        
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            self.performSegueWithIdentifier("loggedInSegue", sender: self)
        }

        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = CGPointMake(187.5, 550)
        //loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        (FBSDKProfile.enableUpdatesOnAccessTokenChange(true))
        
        
        /*
        var fbSession = PFFacebookUtils.session()
        var accessToken = fbSession.accessTokenData.accessToken
        let url = NSURL(string: "https://graph.facebook.com/me/picture?type=large&return_ssl_resources=1&access_token="+accessToken)
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            
            // Display the image
            let image = UIImage(data: data)
            self.imgProfile.image = image
            
        }
        */
        
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil{
            print("Sesion iniciada")
            self.performSegueWithIdentifier("FBSignUpSegue", sender: self)
        }
        else {
            print (error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("Sesion terminada")
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait]
    }


}

